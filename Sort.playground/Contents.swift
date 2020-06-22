import UIKit
/*
두가지 type: named type , compund type
named type - class , struct, enum, protocol
 named type 중 데이터타입 - Int, String, ...
compound type - function type, tuple type
*/
//NSObject


class MyType:NSObject {
    var value: Int = 051
   
    override var description: String {
        return "\(value)"
    }
}

let v3 = MyType()
//print(v3)

struct MyData1: Equatable {
    var value1: Int = 0
    var value2: Int = 0
    
}

//func == (lhs: MyData1, rhs: MyData1) -> Bool {
//    return (lhs.value1 == rhs.value1 && lhs.value2 == rhs.value2)
//}

let v11 = MyData1(value1: 10, value2: 20)
let v12 = MyData1(value1: 20, value2: 40)
let v13 = MyData1(value1: 10, value2: 20)

v11 == v12    // false
v11 == v13    // true




func bubbleSort<T:Comparable>(input:[T]) -> [T] {
    var result:[T] = input
    for x in 0...(input.count-2) {
        for y in 0...(input.count-2-x) {
            if result[y] > result[y+1] {
                (result[y],result[y+1]) = (result[y+1],result[y])
            }
        }
        print(result)
    }
    return result
}


//bubbleSort(input: [7,4,5,1,3])

let defaultValue = [9,6,7,3,5]
let a = [1,2,3,4,5,3]

// 선택정렬
func selectionSort<T:Comparable>(input:[T]) -> [T] {
    var result:[T] = input
    
    for x in 0...(input.count-2) {
        var leastValueLocation = x
        for y in x+1...(input.count-1) {
            if result[leastValueLocation] > result[y] {
                leastValueLocation = y
            }
        }
        
        if x != leastValueLocation {
            (result[x],result[leastValueLocation]) = (result[leastValueLocation],result[x])
        }
    print(result)

    }
    return result
}
//selectionSort(input: defaultValue)


//삽입정렬

//func insertionSort<T:Comparable>(input:[T]) -> [T] {
//    var result:[T] = input
//
//
//
//
//
//    return result
//}
//
//
//func basicSort<T:Comparable>(input:[T]) -> [T] {
//    var result:[T] = input
//    return result
//}


struct Heap<Element: Comparable> {
// 값에 Comparable 프로토콜 채택하게한 건 sort 에 <,> 넣을 거라서
    
    var elements: [Element] = []
// 배열로 구현할거야.  트리는 O(log n) / 배열은 O(1) random access
    let sort: (Element, Element) -> Bool // 함수임 , < 이나 > 용도로 쓸거임
    
    init(sort: @escaping (Element,Element) -> Bool, elements: [Element] = []) {
        // sort 에 < , > 넣는거 개꿀딴지^^
        // @escaping 키워드는 아래에 따로 설명
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1){
                // 랜덤한 배열을 Heap 구조로 바꿈
                // stride 는 글로벌함수로 for 문의 반복 설정할때
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return 2*index + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return 2*index + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }

    mutating func remove() -> Element? {
    // swap 은 O(1) 이고 sifhDown 은 O(log n) 이라서 전체 시간복잡도 O(log n)
        guard !isEmpty else { // 비어있지 않으면 삭제 연산 진행할것
            return nil
        }
        elements.swapAt(0, count - 1) // Array 의 swapAt 메소드 활용
        defer {
            // defer 키워드는 { } 실행구문 안의 로직을 가장 마지막에 실행하도록 순서를 보장해주는 역할
            // 어디 위치에 있어서 실행 순서는 가장 마지막.
            siftDown(from: 0) // 루트노드 sift Down
        }
        return elements.removeLast() // 삭제할 노드 삭제후 반환하기.
    }
    
    mutating func siftDown(from index: Int) {
        // 이 메소드가 실행될 시점에선 배열의 가장 크거나 작은 놈이 루트노드가 되어있는 시점임.
        var parent = index
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            // left, right 가 parent 가 변함에 따라 변하니까 var 라고 하기 쉬운데
            // while 의 { } 입장에서는 변하지 않는 값이므로 let 임을 유의
            
            var candidate = parent // 탐색할 아이 지정
            if left < count , sort(elements[left], elements[candidate]) {
                // 왼쪽 자식노드가 있고, 그 자식노드 값이 부모노드 값보다 크다면
                candidate = left
            }
            if right < count , sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {  // 종료조건
                // return 만날때까지 무한반복, 위의 조건에 부합하지 않는 순서일 때 return 하는 것.
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }


}

let heap = Heap(sort: <#T##(_, _) -> Bool#>)
