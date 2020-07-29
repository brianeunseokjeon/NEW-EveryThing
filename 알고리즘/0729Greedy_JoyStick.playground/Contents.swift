import UIKit

// 그리디 - 조이스틱 레벨2
func joyStickMoveCount(char:Character) -> Int {
    switch char {
    case "B","Z":
        return 1
    case "C","Y":
        return 2
    case "D","X":
        return 3
    case "E","W":
        return 4
    case "F","V":
        return 5
    case "G","U":
        return 6
    case "H","T":
        return 7
    case "I","S":
        return 8
    case "J","R":
        return 9
    case "K","Q":
        return 10
    case "L","P":
        return 11
    case "M","O":
        return 12
    case "N":
        return 13
    default:
        return 0
    }
}
var aa = "BBBAAAAAAAAAB"
aa.count
func findSequenceMinIndexAndMaxIndex(str:String) -> (Int,Int) {
    var max = 0
    var index = -1
    var minIndex = 0
    var count = 0
    for s in str {
        index += 1
        if s != "A" {
            if max < count {
                max = count
                minIndex = index - max
            }
            count = 0
        } else {
            count += 1
//            if max < count {
//                max = count
//                minIndex = index - max
//            }
        }
    }
    return (minIndex,minIndex+max-1)
}

findSequenceMinIndexAndMaxIndex(str: aa)


//aa.last
//aa.lastIndex(of: aa.last!)
//aa.popLast()
//aa
func solution(_ name:String) -> Int {
    var count = 0
    let frontCount = findSequenceMinIndexAndMaxIndex(str: name).0
    let rearCount = name.count - 1 - findSequenceMinIndexAndMaxIndex(str: name).1
    
    if frontCount == 0 && name.count == rearCount {
        count += name.count-1
    } else if frontCount == 0 {
         count += rearCount
    } else if rearCount == 0 {
        count += frontCount
    } else if frontCount > rearCount {
        count += rearCount * 2 + frontCount - 1
    } else {
        count += (frontCount - 1) * 2 + rearCount
    }
    let temp = count
    for x in name {
        count += joyStickMoveCount(char: x)
    }
    if temp == count {
        return 0
    } else {
        return count
    }
    

    
}
//solution("BBAAA")
solution("AAAAABAAAAB")
//14
13



print(1)
