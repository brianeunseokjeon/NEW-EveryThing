import UIKit

//완전탐색
// 모의고사 1단계
func solution(_ answers:[Int]) -> [Int] {
    let solution = [[1,2,3,4,5],[2, 1, 2, 3, 2, 4, 2, 5],[3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    var point = [0,0,0]
    
    for (idx,answer) in answers.enumerated() {
        for (pointIndex,numbersAsnwers) in solution.enumerated() {
            let solutionCount = numbersAsnwers.count
            let index = idx % solutionCount
            if answer == numbersAsnwers[index] {
                point[pointIndex] += 1
            }
        }
    }
    let maxValue = point.max()
    let result = point.enumerated().filter{$0.element == maxValue}.map{$0.offset+1}
    return result
}

//solution([1,3,2,4,2])

// 소수 찾기 레벨2

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

func solution(_ numbers:String) -> Int {
    let numberArray = numbers.map{String($0)}
    var everyNumber = [Int]()
    var result = [Int]()
    for r in 1...numberArray.count {
        let basic = Array(Set(combination(n: numberArray.count, r: r, targetArray: numberArray, basic: "")))
        for one in basic {
           let per = Array(Set(permutation(n: r, r: r, targetArray: one, basic: "")))
           let reduceArray = per.map{$0.reduce("") { (first, se) -> String in
                return first+se
           }}.map{Int($0)!}
           everyNumber += reduceArray
        }
    }
    everyNumber = Array(Set(everyNumber.filter{$0 > 1}))
    
    for num in everyNumber {
        var isPrime = true
        if num == 2 {
            result.append(num)
            continue
        }
        for x in 2...Int(sqrt(Double(num)))+1 {
            if num % x == 0 {
                isPrime = false
            }
        }
        if isPrime == true {
            result.append(num)
        }
        
    }
    return Set(result).count
}



