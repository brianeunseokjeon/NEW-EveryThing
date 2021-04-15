import UIKit

var str = "Hello, playground"


// 신규 아이디 추천

func solution(_ new_id:String) -> String {
    //1 소문자 치환
    let lowCased = new_id.lowercased()
    var second = ""
    //2. 소문자, 숫자, 빼기, 밑줄, 마침표 제외
    for c in lowCased {
        let asci =  c.asciiValue!
        if (asci > 96 && asci < 123) || (asci > 47 && asci < 58) || c == "-" || c == "_" || c == "." {
            second += String(c)
        }
    }
    //3. 마침표 2개 이상 연속이면 한개로
    while second.contains("..") {
        second = second.replacingOccurrences(of: "..", with: ".")
    }
    //4. 처음이나 마지막 . 위치하면 삭제
    while second.first == "." || second.last == "." {
        if second.first == "." {
            second.removeFirst()
        }
        if second.last == "." {
            second.removeLast()
        }
    }
    
    //5 . 빈문자열이면 "a" 대입
    
    if second == "" {
        second = "a"
    }
    
    //6 단계 16자 이상이면 15개 제외하고 문자 제거, 제거후 마침표 있다면 마지막 마침표 제거
    if second.count > 15 {
        second.removeSubrange(second.index(second.startIndex, offsetBy: 15)..<second.endIndex)
    }
    
    if second.last == "."{
        second.removeLast()
    }
    // 7단계 2자 이하라면,
    while second.count < 3 {
        second += String(second.last!)
    }
    return second
}


func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var container:[Int] = []
    var myBoard = board
    var moveContainer = moves
    var result = 0
    
    while !moveContainer.isEmpty {
        let move = moveContainer.removeFirst() - 1
        for (index,rowBoard) in myBoard.enumerated() {
            if rowBoard[move] == 0 {
                continue
            } else {
                let currentInputData = myBoard[index].remove(at: move)
                myBoard[index].insert(0, at: move)
                if container.isEmpty {
                    container.append(currentInputData)
                } else {
                    if container.last == currentInputData {
                        container.removeLast()
                        result += 2
                    } else {
                        container.append(currentInputData)
                    }
                }
                break
            }
        }
    }
    return result
}

//solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])

extension Int {
    func distanceKeypad(current key:Int,goalKey:Int) -> Int {
        if key == 1 || key == 3 {
            switch goalKey {
            case 2: return 1
            case 5: return 2
            case 8: return 3
            case 0: return 4
            default:
                return 0
            }
        } else if key == 4 || key == 6 {
            switch goalKey {
            case 2: return 2
            case 5: return 1
            case 8: return 2
            case 0: return 3
            default:
                return 0
            }
        } else if key == 7 || key == 9 {
            switch goalKey {
            case 2: return 3
            case 5: return 2
            case 8: return 1
            case 0: return 2
            default:
                return 0
            }
        } else if key == 101 || key == 202 {
            switch goalKey {
            case 2: return 4
            case 5: return 3
            case 8: return 2
            case 0: return 1
            default:
                return 0
            }
        } else if key == 2 {
            switch goalKey {
            case 2: return 0
            case 5: return 1
            case 8: return 2
            case 0: return 3
            default:
                return 0
            }
        } else if key == 5 {
            switch goalKey {
            case 2: return 1
            case 5: return 0
            case 8: return 1
            case 0: return 2
            default:
                return 0
            }
        } else if key == 8 {
            switch goalKey {
            case 2: return 2
            case 5: return 1
            case 8: return 0
            case 0: return 1
            default:
                return 0
            }
        }else if key == 0 {
            switch goalKey {
            case 2: return 3
            case 5: return 2
            case 8: return 1
            case 0: return 0
            default:
                return 0
            }
        } else {
            return 0
        }
    }
}


func solution(_ numbers:[Int], _ hand:String) -> String {
    var currentLeft = 101
    var currentRight = 202
    var keyPads = numbers
    var result = ""
    
    while !keyPads.isEmpty {
        let currentKey = keyPads.removeFirst()
        if currentKey == 1 || currentKey == 4 || currentKey == 7 {
            result += "L"
            currentLeft = currentKey
        } else if currentKey == 3 || currentKey == 6 || currentKey == 9 {
            result += "R"
            currentRight = currentKey
        } else {
            let leftDistance = currentKey.distanceKeypad(current: currentLeft, goalKey: currentKey)
            let rightDistance = currentKey.distanceKeypad(current: currentRight, goalKey: currentKey)
            print("현재 키 :",currentKey, "현재 왼쪽 키",currentLeft, "현재 오른쪽 키 :",currentRight, "왼쪽 거리 :",leftDistance, "오른 거리 :",rightDistance)
            if leftDistance == rightDistance {
                if hand == "left" {
                    result += "L"
                    currentLeft = currentKey
                } else {
                    result += "R"
                    currentRight = currentKey
                }
            } else if leftDistance > rightDistance {
                result += "R"
                currentRight = currentKey
            } else {
                result += "L"
                currentLeft = currentKey
            }
        }
    }
    
    
    
    return result
}


//let sol = ([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5],"right")
let sol = ([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2],"left")
//let sol = ([1, 2, 3, 4, 5, 6, 7, 8, 9, 0],"right")

//solution(sol.0, sol.1)
//let phoneNumber = [
//    "1":(0, 0),"2":(0, 1),"3":(0, 2),
//    "4":(1, 0),"5":(1, 1),"6":(1, 2),
//    "7":(2, 0),"8":(2, 1),"9":(2, 2),
//    "*":(3, 0),"0":(3, 1),"#":(3, 2)
//]
//
//func solution(_ numbers:[Int], _ hand:String) -> String {
//    var answer = ""
//    var left = "*"
//    var right = "#"
//    let hand = hand == "right" ? "R" : "L"
//
//    for number in numbers {
//        if [1,4,7].contains(number) {
//            answer += "L"
//            left = String(number)
//        } else if [2,5,8,0].contains(number) {
//            let distByLeft = dist(left, String(number))
//            let distByRight = dist(right, String(number))
//
//            // 거리 계산
//            if distByLeft < distByRight {
//                answer += "L"
//                left = String(number)
//            } else if distByLeft > distByRight {
//                answer += "R"
//                right = String(number)
//            } else if distByLeft == distByRight {
//                answer += hand
//                if hand == "L" {
//                    left = String(number)
//                } else if hand == "R" {
//                    right = String(number)
//                }
//            }
//
//        } else if [3,6,9].contains(number) {
//            answer += "R"
//            right = String(number)
//        }
//    }
//
//    return answer
//}
//
//func dist(_ start: String, _ dest: String) -> Int {
//    let x = phoneNumber[start]!.0
//    let y = phoneNumber[start]!.1
//
//    let xx = phoneNumber[dest]!.0
//    let yy = phoneNumber[dest]!.1
//
//    return abs(x-xx) + abs(y-yy)
//}


func solution(_ numbers:[Int]) -> [Int] {
    var numberSet = Set<Int>()
    for (idx,first) in numbers.enumerated() {
        for sIdx in idx+1..<numbers.count {
            numberSet.insert(first+numbers[sIdx])
        }
    }
    
    return Array(numberSet).sorted(by: <)
}
//solution([2,1,3,4,1])


func solution(_ n:Int) -> Int {
    var num = n
    var array = Array<Int>()
    var result = 0
    while num > 0 {
        array.append(num%3)
        num /= 3
    }
    
    for (idx,value) in array.reversed().enumerated() {
        result += Int(pow(3, Double(idx)) * Double(value))
    }
    
    return result
}
//solution(45)
//func solution(_ n:Int) -> Int {
//      let flipToThree = String(n,radix: 3)
//      let answer = Int(String(flipToThree.reversed()),radix:3)!
//      return answer
//
//  }

// 소수만들기
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

func prime(_ sosu: Int) -> Bool {
    if sosu < 2 {
        return false
    }
    for i in 2..<Int(sqrt(Double(sosu)))+1 {
        if (sosu % i) == 0 {
            return false
        }
    }
    return true
}
func solutionPrimeNumberMake(_ nums:[Int]) -> Int {
    var answer = 0
    
    let combinationTotal = combination(n: nums.count, r: 3, targetArray: nums, basic: 0)
    let sumTotalArray = combinationTotal.map{$0.reduce(0){$0+$1}}.filter{prime($0)}
    

    return sumTotalArray.count
}
//solutionPrimeNumberMake([1,2,7,6,4])





func poket(nums:[Int]) -> Int {
    let count = nums.count / 2
    let setNums = Set(nums)
    if count >= setNums.count {
        return setNums.count
    } else {
        return count
    }
}
//poket(nums: [3,3,3,2,2,2])



func solution(_ d:[Int], _ budget:Int) -> Int {
    var sortedPart = d.sorted(by: <)
    var myBudget = budget
    var count = 0
    while !sortedPart.isEmpty {
        let partBudget = sortedPart.removeFirst()
        if myBudget - partBudget >= 0 {
            count += 1
            myBudget -= partBudget
        } else {
            return count
        }
    }
    
    return count
}
solution([2,2,3,3], 10)
