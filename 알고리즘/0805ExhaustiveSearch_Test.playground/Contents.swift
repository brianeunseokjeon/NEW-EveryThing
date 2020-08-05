import UIKit

var str = "Hello, playground"
func solution(_ answers:[Int]) -> [Int] {
    let first = [1,2,3,4,5]
    let second = [2,1,2,3,2,4,2,5]
    let third = [3,3,1,1,2,2,4,4,5,5]
    var rightAnswerCount:[Int] = [0,0,0]
    var result:[(index:Int,solCount:Int)] = []
    for (index,sol) in answers.enumerated() {
        if sol == first[index%first.count] {
            rightAnswerCount[0] += 1
        }
        if sol == second[index%second.count] {
            rightAnswerCount[1] += 1
        }
        if sol == third[index%third.count] {
            rightAnswerCount[2] += 1
        }
    }
    for (index,value) in rightAnswerCount.enumerated() {
        if result.isEmpty {
            result.append((index,value))
        } else {
            if result[0].solCount < value {
                result.removeAll()
                result.append((index,value))
            } else if result[0].solCount == value {
                result.append((index,value))
            }
        }
        
    }
    return result.map{$0.index+1}
}
solution([1,2,3,4,5])
solution([1,3,2,4,2])
