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
solution(5)

