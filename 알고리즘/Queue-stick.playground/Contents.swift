import UIKit


// 프로그래머스 - 쇠막대기
func solution(_ arrangement:String) -> Int {
    var queue:[Character] = []
    var stickCount = 0
    var answer = 0
    var count = 0
    for x in arrangement {
        count += 1
        if  x == "(" {
            answer += 1
            stickCount += 1
        } else if x == ")" {
            stickCount -= 1
            if queue.last == "(" && x == ")" {
                answer += stickCount
                answer -= 1
            }
        }
        queue.append(x)
    }
    return answer
}

solution("()(((()())(())()))(())")


// 밑에 replacingOccurrences 를 사용할시 문제가 너무 쉬워짐..;; 괄호 있을때 스텍에 추가. l 만나면 스택에 있는 갯수 답에 추가, ) 만나면 답에 +1 (레이저를 한번자르면 두토막되는것처럼..) 그리고 스택에서 팝시켜버림..; 와우..
var arrangement = "()(((()())(())()))(())"
let newArrangement = arrangement.replacingOccurrences(of: "()", with: "l")
