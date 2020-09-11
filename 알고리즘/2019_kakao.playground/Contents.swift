import UIKit

//2019 카카오_오픈채팅방
let b = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

func solution1(_ record:[String]) -> [String] {
    var answer:[String] = []
    var userList: [String:String] = Dictionary<String,String>()
    
    for i in record {
        let type = i.split(separator: " ")[0]
        let id = String(i.split(separator: " ")[1])
        if type == "Enter" || type == "Change" {
            userList.updateValue(String(i.split(separator: " ")[2]), forKey: id)
        }
    }
    
    for i in record {
        let type = i.split(separator: " ")[0]
        let id = String(i.split(separator: " ")[1])
        if type == "Enter" {
            answer.append(userList[id]! + "님이 들어왔습니다.")
        } else if type == "Leave" {
            answer.append(userList[id]! + "님이 나갔습니다.")
        }
    }
    
    return answer
}
//solution1(b)

// 실패율
func solution2(_ N:Int, _ stages:[Int]) -> [Int] {
    var answer: [Int:Double] = [:]
    var length = Double(stages.count)
    for stage in (1...N) {
        let count = Double(stages.filter{ stage == $0 }.count)
        var fail = 0.0
        if length == 0 {
            fail = 0
        } else {
            fail = count / length
        }
        answer.updateValue(fail, forKey: stage)
        length -= count
    }
   let f = answer.sorted { (arg0, arg1) -> Bool in
        if arg0.value == arg1.value {
            return arg0.key > arg1.key
        }
        return arg0.value < arg1.value

   }.map{$0.key}.reversed().map{$0}
    return f
}
//solution2(5,[2, 1, 2, 6, 2, 4, 3, 3])
//solution2(4, [4,4,4,4,4])



//후보키

func comb(initArr:[Int],arr:[Int],index:Int ,n:Int, r:Int,target:Int) {
    var array = arr
    if r == 0 {
        resultContainerArray.append(array)
    } else if target == n {
        return
    } else {
        array[index] = initArr[target]
        comb(initArr: initArr, arr: array, index: index+1, n: n, r: r-1, target: target+1)
        comb(initArr: initArr, arr: array, index: index, n: n, r: r, target: target+1)
    }
    
}

var resultContainerArray:[[Int]] = []


func isUnique(input:[[String]]) -> [[Int]] {
    var uniqueArray = [[Int]]()
    for arr in resultContainerArray {
        var tempSet:Set<String> = []
        var isOkay = true
        for i in input {
            var temp = ""
            for x in arr {
               temp += i[x]
            }
            if tempSet.contains(temp) {
                isOkay = false
                break
            } else {
               tempSet.insert(temp)
            }
        }
        if isOkay {
            uniqueArray.append(arr)
        }
    }
    return uniqueArray
}


func solution3(_ relation:[[String]]) -> Int {
    let initArr = [Int](0..<relation[0].count)
    
    for i in 1...initArr.count {
        let cho = Array<Int>.init(repeating: 0, count: i)
        comb(initArr: initArr, arr: cho, index: 0, n: initArr.count, r: i, target: 0)
    }
    

    var result = [Set<Int>]()
    let uniqueArray = isUnique(input: relation)
    for x in uniqueArray {
        let setTemp = Set(x)
        var isOkay = true
        for y in result {
            if y.isSubset(of: setTemp) {
                isOkay = false
                break
            }
        }
        if isOkay {
            result.append(setTemp)
        }
    }
    return result.count
}


let xx = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]

//solution3(xx)


//먹방 라이브쇼 > 그리디 문제

func solution4(_ food_times:[Int], _ k:Int64) -> Int {
    var total:Int = 0
    var length:Int = food_times.count
    var sumValue:Int = 0
    var previous:Int = 0
    var sortByMinimum:[(count:Int,Index:Int)] = []
    var target:Int = 0
    
    for (index,count) in food_times.enumerated() {
        total += count
        sortByMinimum.append((count,index+1))
    }
    
    if total <= k {
        return -1
    }
    sortByMinimum.sort{$0.count < $1.count}
    
    while sumValue + ((sortByMinimum[0].count - previous) * length) <= k {
        let now = sortByMinimum[0].count
        sumValue += (now - previous) * length
        length -= 1
        sortByMinimum.remove(at: 0)
        previous = now
    }
    target = Int(k) - sumValue
    length = sortByMinimum.count
    sortByMinimum.sort{$0.Index<$1.Index}

    return sortByMinimum[target % length].Index
}
//solution4([3, 1, 2], 5)
//solution4([1, 1, 1,1], 4)


//4 길찾기 -> 그래프문제
public func processTime(blockFunction: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    blockFunction()
    let processTime = CFAbsoluteTimeGetCurrent() - startTime
    print("Processing Time = \(processTime)")
}

public func example(of: String, isAction: Bool = true, action: () -> Void) {
    print("\n ---------\(of), isAction: \(isAction)---------")
    
    if isAction {
        action()
    }
}
public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    var leftBoundMin: Int
    var leftBoundMax: Int
    var rightBoundMin: Int
    var rightBoundMax: Int
    
    public init(value: Element,leftBoundMin:Int,leftBoundMax:Int,rightBoundMin:Int,rightBoundMax:Int) {
        self.value = value
        self.leftBoundMin = leftBoundMin
        self.leftBoundMax = leftBoundMax
        self.rightBoundMin = rightBoundMin
        self.rightBoundMax = rightBoundMax
    }
}

/**
 BinaryNode Diagram
 */
//extension BinaryNode: CustomStringConvertible {
//    public var description: String {
//        return diagram(for: self)
//    }
//
//    private func diagram(for node: BinaryNode?,
//                         _ top: String = "",
//                         _ root: String = "",
//                         _ bottom: String = "") -> String {
//        guard let node = node else {
//            return root + "nil\n"
//        }
//        if node.leftChild == nil && node.rightChild == nil {
//            return root + "\(node.value)\n"
//        }
//        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
//            + root + "\(node.value)\n"
//            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
//    }
//}



extension BinaryNode {
    
    /**
     중위 순회 방식, 방식은 구현방식마다 조금씩 차이가 있지만, 구현 원리는 같음. 재귀적으로 자식노드의 유무를 가지고 순회하며 값을 출력합니다.
     */
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /**
     전위 순회는 항상 현재의 노드를 먼저 방문합니다.
     */
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    /**
     후위 순회는 항상 현재의 노드를 먼저 방문 합니다.
     */
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

func solution4(_ nodeinfo:[[Int]]) -> [[Int]] {
    var addIndex:[(x:Int,y:Int,index:Int)] = []
    for (index,value) in nodeinfo.enumerated() {
        addIndex.append((x:value[0],y:value[1],index:index+1))
    }
    let sortedByBigY = addIndex.sorted{$0.y>$1.y}
    var sameLevelArr: [[(x:Int,index:Int)]] = []
    var now = -1
    
    for i in sortedByBigY {
        let yValue = i.y
        if yValue != now {
            sameLevelArr.append([])
            now = yValue
        }
        sameLevelArr[sameLevelArr.count-1].append((x: i.x, index: i.index ))
    }
    
    // x좌표를 기준으로 정렬
    for i in 1..<sameLevelArr.count {
        sameLevelArr[i].sort{$0.x<$1.x}
    }
    let root = BinaryNode(value: sortedByBigY[0].index, leftBoundMin: 0, leftBoundMax: sortedByBigY[0].x-1, rightBoundMin: sortedByBigY[0].x+1, rightBoundMax: 100000)
    var nodeList:[[BinaryNode<Int>]] = [[BinaryNode]]()
    nodeList.append([root])
    for level in 1..<sameLevelArr.count {
        nodeList.append([])
        for data in sameLevelArr[level] {
            let xValue = data.x
            let idx = data.index
            for parent_node in nodeList[level-1] {
                if xValue >= parent_node.leftBoundMin && xValue <= parent_node.leftBoundMax {
                    let nowNode = BinaryNode(value: idx, leftBoundMin: parent_node.leftBoundMin, leftBoundMax: xValue - 1, rightBoundMin:  xValue + 1, rightBoundMax: parent_node.leftBoundMax)
                    parent_node.leftChild = nowNode
                    nodeList[level].append(nowNode)
                } else if xValue >= parent_node.rightBoundMin && xValue <= parent_node.rightBoundMax {
                    let nowNode = BinaryNode(value: idx, leftBoundMin: parent_node.rightBoundMin, leftBoundMax: xValue - 1, rightBoundMin:  xValue + 1, rightBoundMax: parent_node.rightBoundMax)
                    parent_node.rightChild = nowNode
                    nodeList[level].append(nowNode)
                }
            }
        }
    }
    var result:[[Int]] = [[],[]]
    root.traversePreOrder { (value) in
        result[0].append(value)
    }
    root.traversePostOrder { (value) in
        result[1].append(value)
    }
    
    return result
}
let nodes = [[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]
solution4(nodes)
