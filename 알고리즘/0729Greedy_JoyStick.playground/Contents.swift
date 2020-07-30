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
var gg = "BCDFE"
var hh = "AAAAA"
var aa = "BBBAAAAAAAAAB"
aa.count
var bb = "BBAAAA"
var cc = "BBAACCCAAAAAABBBB"
cc.count

func findSequenceMinIndexAndMaxIndex(str:String) -> (Int,Int) {
    var max = 0
    var index = -1
    var minIndex = 0
    var count = 0
    for s in str {
        index += 1
        
        if s == "A" {
            count += 1
            if max <= count {
                max = count
                minIndex = index - max + 1
            }
        } else if s != "A" {
            count = 0
        }
    }
    return (minIndex,minIndex+max-1)
}
//findSequenceMinIndexAndMaxIndex(str: gg)
//findSequenceMinIndexAndMaxIndex(str: hh)
//findSequenceMinIndexAndMaxIndex(str: aa)
//findSequenceMinIndexAndMaxIndex(str: bb)
//findSequenceMinIndexAndMaxIndex(str: cc)

//AABBABBAA

//aa.last
//aa.lastIndex(of: aa.last!)
//aa.popLast()
//aa
func solution(_ name:String) -> Int {
    var count = 0
    let frontCount = findSequenceMinIndexAndMaxIndex(str: name).0
    let rearCount = name.count - 1 - findSequenceMinIndexAndMaxIndex(str: name).1
    
    //조이스틱으로 오른쪽 왼쪽 이동횟수
    if frontCount == 0 && name.count == rearCount {
        count += name.count-1
    } else if frontCount == 0 {
         count += rearCount
    } else if frontCount > rearCount {
        count += rearCount * 2 + frontCount - 1
    } else {
        count += (frontCount - 1) * 2 + rearCount
    }
    
    // 전부 AAAA일경우 횟수 0
    let temp = count
    // 조이스틱으로 위아래 이동횟수
    for x in name {
        count += joyStickMoveCount(char: x)
    }
    if temp == count {
        return 0
    } else {
        return count
    }
}

//모두다 같은경우
solution("AAA") //0

//끝에가 AAA
solution("BBAAA") //3
//앞에가 AAA
solution("AAABB") //4
//중간에 A
solution("BBABB")//8
//중간에 AAA 여러개있고, 왼쪽이 갯수가 더 많을경우
solution("BBBBAAAAB")//10
//중간에 AAA 여러개 있고, 오른쪽 갯수가 더 많을경우
solution("BAAAAABBB") //7
//A와 반복
solution("ABABA") //5

solution("ABABAB") //8


//주어진 경우
solution("JEROEN")//56
solution("JAN")//23



solution("BAABBAAAAAACCA")//17
solution("AZAAAZ")//5

6 + 4
5 + 4



print(1)
//문제 4와 7이 같은 스타일 5번은 다른것과 다름.
