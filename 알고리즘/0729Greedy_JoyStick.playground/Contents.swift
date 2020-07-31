import UIKit

// 그리디 - 조이스틱 레벨2

// 좀더 그리디 하게 바꿔봄.. 일일이 리턴값을 만들어주지 않고 -> 최소의 값을 선택하게끔.
func joyStickMoveCount(char:Character) -> Int {
    let characters:[Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let indexValue = characters.firstIndex(of: char)!
    let result = min(indexValue,characters.count-indexValue)
    return result
}
joyStickMoveCount(char: "O")


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
    if minIndex+max == 0 {
        return (0,0)
    } else {
        return (minIndex,minIndex+max-1)
    }
    
}
var gg = "BCDFE"
var hh = "AAAAA"
var aa = "BBBAAAAAAAAAB"
aa.count
var bb = "AAAABB"
var cc = "BBAACCCAAAAAABBBB"
cc.count
findSequenceMinIndexAndMaxIndex(str: "AA")
findSequenceMinIndexAndMaxIndex(str: hh)
//findSequenceMinIndexAndMaxIndex(str: aa)
findSequenceMinIndexAndMaxIndex(str: bb)
//findSequenceMinIndexAndMaxIndex(str: cc)

//AABBABBAA

//aa.last
//aa.lastIndex(of: aa.last!)
//aa.popLast()
//aa
func solution(_ name:String) -> Int {
    var result = 0
    //중간에 AAA(반복되는 A중 가장 많은쪽 or 가장뒤에있는 연속된 A들의 인덱스값들-> frontCount는 그러한 AAA..들의 왼쪽값 / rearCount는 오른쪽값들의 갯수
    let frontCount = findSequenceMinIndexAndMaxIndex(str: name).0
    let rearCount = name.count - 1 - findSequenceMinIndexAndMaxIndex(str: name).1
    var movingForward = 0
    //조이스틱으로 오른쪽 왼쪽 이동횟수
    
    //단순히 앞으로만 이동!
    if rearCount == 0 {
        movingForward = frontCount == 0 ? 0 : frontCount - 1
    } else {
        movingForward = name.count - 1
    }
    
    //(뒤에갔다가 앞으로 오는 전략 or 앞으로 갔다가 뒤로 가는 전략) , 단순히 앞으로 이동 >> 최솟값
    if frontCount <= rearCount {
        let cal = frontCount == 0 ? rearCount : (frontCount - 1) * 2 + rearCount
       result += min(cal , movingForward)
    } else {
        result += min(rearCount * 2 + frontCount - 1, movingForward)
    }
    // 조이스틱으로 위아래 이동횟수
    for character in name {
        result += joyStickMoveCount(char: character)
    }
    return result
}

solution("AAAZAAZA")
//모두다 같은경우
solution("AAAAAAAAA") //0
//
////끝에가 AAA
solution("BBAAA") //3
////앞에가 AAA
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

solution("BABAB") // 7
solution("M")

//주어진 경우
solution("JEROEN")//56
solution("JAN")//23



solution("BAABBAAAAAACCA")//17
solution("AZAAAZ")//5


print(1)
//문제 4와 7이 같은 스타일 5번은 다른것과 다름.
