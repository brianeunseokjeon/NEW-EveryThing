import UIKit

//조합


func combination<T:Hashable>(n:Int,r:Int,targetArray:[T],basic:T) -> [[T]] {
    var result: [[T]] = []
    let array = Array<T>.init(repeating: basic, count: r)
    
    func comb(repeatArr:[T],index:Int ,n:Int, r:Int,targetArray:[T],target:Int) {
        var array = repeatArr
        if r == 0 {
            result.append(array)
        } else if target == n {
            return
        } else {
            array[index] = targetArray[target]
            comb(repeatArr: array, index: index+1, n: n, r: r-1,targetArray: targetArray ,target: target+1)
            comb(repeatArr: array, index: index, n: n, r: r,targetArray: targetArray ,target: target+1)
        }
    }
    comb(repeatArr: array, index: 0, n: n, r: r,targetArray: targetArray , target: 0)
    return result
}


combination(n: 5, r: 5, targetArray: ["a","B","C","D","9"], basic: "")


// 중복 조합
func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }

    guard let first = elements.first else {
        return []
    }

    let head = [first]
    let subcombos = combos(elements: elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements: elements.dropFirst(), k: k)

    return ret
}


//func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
//    return combos(elements: ArraySlice(elements), k: k)
//}

//combos(elements: [1,3,5,6,7], k: 3)


// 순열

func permutation<T:Hashable>(n:Int,r:Int,targetArray:[T],basic:T) -> [[T]] {
    var result: [[T]] = []
    let basicArray = Array<T>.init(repeating: basic, count: r)
    let visited : [Bool] = Array(repeating: false, count: n)

    func permutation(_ targetArr : [T],_ output : [T],_ visited : [Bool],_ depth : Int,_ n : Int,_ r : Int){
        var output = output
        var visited = visited

        if depth == r {
             result.append(output)
            return
        }
        for i in 0..<n {
            if visited[i] != true {
                visited[i] = true
                output[depth] = targetArr[i]
                permutation(targetArr,output,visited,depth + 1,n,r)
                output[depth] = basic
                visited[i] = false
            }
        }
    }
    permutation(targetArray, basicArray, visited, 0, n, r)
    return result
}
let targetArray = [1,3,4,5]

//print(permutation(n: targetArray.count, r: 2, targetArray: targetArray, basic: 0))

//sorted 는 자기가 변환안하고 변환된걸 리턴만, sort는 자기가 변환 mutating

//거듭제곱 -> 2^3 = 8
//pow(2, 3)

//올림 / 내림 / 반올림
ceil(6.3) // 7
floor(6.3) // 6
round(6.3) // 5
