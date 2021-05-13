import UIKit

//2레벨 스킬트리



func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    let skillArray = skill.map{String($0)}
    var count = 0
    for skillTree in skill_trees {
        let currentSkillCheckArray = skillTree.map{String($0)}
        var currentIndex = -1
        var index = 0
        for skill in skillArray {
            if let containIndex = currentSkillCheckArray.firstIndex(of: skill) {
                if containIndex >= currentIndex {
                    currentIndex = containIndex
                    
                } else {
                    break
                }
                
            } else {
                currentIndex = 10000
            }
            
            index += 1
            print("현재 스킬트리 :",skillTree,"인덱스",index,"스킬 ㅣ",skill)
        }
        if skill.count == index {
            count += 1
        }
        
    }
    return count
}


// 브레이크는 현재 안에있는 for구문만 멈춤.. 첫번째 for문 의 다음 타겟 진행됨.

//solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"])
//for x in [1,3,2,5,7,9] {
//    for a in [1,2,3,4,5,6] {
//        print("현재어디일까?",x,a)
//        if x % 2 == 0 {
//            break
//        }
//
//    }
//    print("여기 언제 불릴가요 ₩~~~~~~")
//}

//최대공약수
func gcd(_ w:Int, _ h:Int) -> Int {
    var maxNumber = max(w, h)
    var minNumber = min(w,h)

    while maxNumber % minNumber != 0 {
        let temp = maxNumber % minNumber
        maxNumber = max(minNumber, temp)
        minNumber = min(minNumber, temp)
    }

    return minNumber
}
// 최소공배수
func lcm(_ a: Int, _ b:Int) -> Int {
    return a * b / gcd(a,b)
}


func solution(_ w:Int, _ h:Int) -> Int64{
    let gcdValue = gcd(w, h)
    
    let basicW = w/gcdValue
    let basicH = h/gcdValue
    let sum = basicW + basicH - 1
    let total = w * h
    

    return Int64(total - (sum * gcdValue))
}

//solution(8, 12)



// 삼각 달팽이
func solution(_ n:Int) -> [Int] {
    let delta:[(x:Int,y:Int)] = [(1,0),(0,1),(-1,-1)]
    var currentDeltaIndex = 0
    var makeOccupyIndex = 0
    var point = (-1,0)
    var numbering = 0
    var totalCount = 0
    var array:[[Int]] = []
    while makeOccupyIndex < n {
        makeOccupyIndex += 1
        let temp = Array.init(repeating: 0, count: makeOccupyIndex)
        array.append(temp)
        totalCount += makeOccupyIndex
    }
    
    while numbering < totalCount {
        point.0 += delta[currentDeltaIndex%3].x
        point.1 += delta[currentDeltaIndex%3].y
        numbering += 1
        array[point.0][point.1] = numbering

//        print("현재 array :",array)
//        print("point :",point)
        
        if currentDeltaIndex == 0 && point.0 == n-1 {
            currentDeltaIndex += 1
        } else if currentDeltaIndex == 1 && point.1 == n-1 {
            currentDeltaIndex += 1
        } else if array[point.0 + delta[currentDeltaIndex%3].x][point.1 + delta[currentDeltaIndex%3].y] != 0 {
            currentDeltaIndex += 1
        }
    }
    return array.flatMap{$0}
}
//solution(5)

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

// 포인트는 조합. 각 course에 맞는 각 order의 조합을 구해 거기서 최대값을 계속 찾아 그게 끝.
func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = Array<String>()
    
    for count in course {
        var currentSaveDic = [[String]:Int]()
        var maxCount = 2
        var maxSave:[String] = []
        for order in orders {
            let orderArray = order.map{String($0)}.sorted()
            let comb = combination(n: orderArray.count, r: count, targetArray: orderArray , basic: "")
            for x in comb {
                if currentSaveDic[x] == nil {
                    currentSaveDic.updateValue(1, forKey: x)
                } else {
                    currentSaveDic[x]! += 1
                    if maxCount < currentSaveDic[x]! {
                        maxSave.removeAll()
                        maxSave.append(x.reduce("", +))
                        maxCount = currentSaveDic[x]!
                    } else if maxCount == currentSaveDic[x]! {
                        maxSave.append(x.reduce("", +))
                    } else { }
                }
            }
        }
        result += maxSave
    }
    return result.sorted()
}

let orders = (["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"],[2,3,4])
//let orders = (["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"],[2,3,5])
//let orders = (["XYZ", "XWY", "WXA"],[2,3,4])

//solution(orders.0, orders.1)




func solution(_ s:String) -> [Int] {
    var arragedArray = s.split(separator: "}").map{$0.trimmingCharacters(in: ["{",","])}
    arragedArray.sort { $0.count < $1.count }
    var result = Array<Int>()
    for value in arragedArray {
        let valueArray = value.split(separator: ",").map{Int($0)!}
        for x in valueArray {
            if !result.contains(x) {
                result.append(x)
            }
        }
    }
    
    return result
}

//let s = "{{2},{2,1},{2,1,3},{2,1,3,4}}"
//let s = "{{1,2,3},{2,1},{1,2,4,3},{2}}"
//let s = "{{20,111},{111}}"
let s = "{{4,2,3},{3},{2,3,4,1},{2,3}}"

//solution(s)

//Summer/Winter Coding(~2018) 영어 끝말잇기

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var updateWordContainer = Array<String>()
    for word in words {
        if updateWordContainer.isEmpty {
            updateWordContainer.append(word)
        } else {
            let lastCharacter = updateWordContainer.last!.last!
            let firstCharacter = word.first!
            if updateWordContainer.contains(word) {
                let totalCount = updateWordContainer.count + 1
                if totalCount % n == 0 {
                    return [n,totalCount/n]
                } else {
                    return [totalCount%n,totalCount/n+1]
                }
            }
            
            if lastCharacter == firstCharacter {
                updateWordContainer.append(word)
            } else {
                let totalCount = updateWordContainer.count + 1
                if totalCount % n == 0 {
                    return [n,totalCount/n]
                } else {
                    return [totalCount%n,totalCount/n+1]
                }
                
            }
            
        }
    }
    
    return [0,0]
}
//solution(2,["hello", "one", "even", "never", "now", "world", "draw"])

["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]


print("java and backend and junior and pizza 100".split(separator: " ").filter{$0 != "and"}.map{String($0)})

struct User {
  
}





func solution(_ info:[String], _ query:[String]) -> [Int] {
    let info = info.map{[$0.split(separator: " ").map{String($0)}]}
    
    return []
}










