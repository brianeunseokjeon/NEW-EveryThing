import UIKit

//6월 24일

/*  자료형 Built-in Data Type / Custom Data Type
    Memory 공부해야 함 => 비트 1 or 0
    
    MSB(최상위 비트)            LSB(최하위 비트)
    0   0   0   1   0   1   1   0
    <----------데이터 비트---------->
 
    -22 표현법 00010110 ->Bitwise Not 11101001 -> +1  11101010

*/

//overflow

let num:Int16 = 9 * 9 * 9


/*:
 ## 수정가능 속성과 수정 불가 속성의 이해 let 클래스 와 let 구조체 등 차이 -p85
 */

struct Person {
    var firstName: String
}

class Address {
    var street: String = ""
}

let personStruct = Person(firstName: "J")
let addressClass = Address()

//personStruct.firstName = "FF" // 오류
addressClass.street = "A Street" //수정가능


/*관련
 iOS에서의 Value Semantics와 Reference Semantics
 Semantics(의미론)의 사전적 의미는 다음과 같다.

 기호 논리학에서 기호와 그 지시하는 대상과의 관련을 연구하는 학문. 기호론의 한 분야

 쉽게 말해 내가 쓰고 있는 어떤 타입(기호)이 내부적으로 value로서 의미가 있는 것인지(대상), 아니면 reference로서 의미가 있는 것인지를 이야기하는 것이다.

 Swift는 두 가지 semantics를 모두 지원하기는 하지만 value semantics에 더 무게를 두고 있다. 그 이유는 Swift가 지원하는 함수 중심 프로그래밍에서는 함수에서 다루는 변수가 reference가 아니고 불변 변수여야만 side effect가 발생하지 않기 때문이다.

 함수 중심적으로 프로그래밍을 하지 않는다 하더라도, value semantics을 사용하는 것은 개발자 입장에서 편리하다. 참조 계산을 자동으로 하도록 도와주는 ARC를 사용하더라도 모든 참조 문제를 해결해주지는 못하기 때문이다. 또 value semantics 방식은 참조 계산을 하지 않기 때문에 병렬 처리와 성능 최적화에도 유리하다.

 Value Semantics
 값을 복사해서 사용
 스택에서 자동 변수로 처리
 참조 계산하지 않는다. 자기 자신을 소유.
 값을 그대로 참조. 불변 상태 유지.
 copy-on-write: 복사 이후에 값 변경하지 전까지는 이전 값을 그대로 사용
 함수 중심 프로그래밍에 적합
 
 
 Reference Semantics
 reference에 대한 포인터만 복사
 힙에서 포인터 변수로 처리
 ARC(자동 레퍼런스 계산) 방식 활용
 언제든지 값이 변경될 수 있음
 병렬 처리 제한, 최적화 한계
 함수 중심 프로그래밍에 부적합
 
 
 
 References
 Cocoa Internals, 김정, 인사이트
 https://oaksong.github.io/2017/12/29/value-semantics-vs-reference-semantics/
 */

//6월 25일
/*:
 # Overflow Addition Operator

 a &+ b
 */
//overflow 허용시 -> 순환 가장 큰거 + 1 -> 제일 작은수
let a: Int8 = Int8.max
let b = a &+ 1

let c: Int8 = Int8.min
let d = c &- 1

let e = Int8.max &* 2 // 127 + 127 -> 127 + 1 -> -128 즉 -128 + 126 = -2


/*:
 ## Short-circuit Evaluation
 단락 평가 -> 스위프트는 논리식을 평가할때 결과를 얻기위한 최소한의 코드만 실행
 ### && -> 앞에 false 이면 바로 false , || -> 앞에 true 이면 바로 true 뒤가 중요하지 않음..
 */

func trueFalse(bool:Bool) -> Bool {
    print("함수 사용됨",bool)
    return bool
}
trueFalse(bool: false) && trueFalse(bool: false)

//side effect - 부작용 or 표현식을 평가했을 때, 값이 변경되거나 상태가 변경되는 것 -> 논리식에 side effect가 발생할 경우엔 조심해야함.

var left = 1
var right = 1
func updateLeft() -> Bool {
    left += 1
    return true
}

func updateRight() -> Bool {
    right += 1
    return true
}
if updateLeft() || updateRight() {
    print("오류 존재")
    print("left :",left ,"right :",right)
}
// 원한 결과 -> left :2 , right:2 하지만 단락평가에 의해 right함수가 실행안됨.. 이럴때 오류생기는것. 조심! 이럴때는

left = 1
right = 1
let resultA = updateLeft()
let resultB = updateRight()

if resultA || resultB {
    print("수정 완료")
    print("left :",left ,"right :",right)
}




/*:
 ## Operator Methods
 */

struct Point {
    var x = 0.0
    var y = 0.0
}

let po1 = Point(x: 12.33, y: 3.41)
let po2 = Point(x: 132.33, y: 33.41)

//po1 == po2 //비교 못함/.

//extension Point: Equatable {
//    static func ==(lhs: Point, rhs: Point) -> Bool {
//        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
//    }
//}
//po1 == po2

extension Point: Equatable {
    //안에 함수를 설정 안해도.. 프로토콜만 설정해도 됨.
}
//내부에 있는 더블값들은 equatable 프로토콜을 채택하고 있음. 지금처럼 형식에 equatable 프로토콜을 채용한 저장속성만 선언되어 있다면, 컴파일러가 자동으로 구현을 추가합니다.
po1 == po2

//단항 연산자 : 전위 연산자 -> -a 이렇게 붙이는 - 연산자를 전위연산자라고 함. / 후치연산자는 뒤에 붙는 거겟죠?
extension Point {
    static prefix func -(pt:Point) -> Point {
        return Point(x: -pt.x, y: -pt.y)
    }
}

let po3 = -po1
po3.x

//후치 연산자 -> 연산도중 현재값을 바꿔야 하기 때문에 파라미터를 입출력 파라미터로 선언
extension Point {
    static postfix func ++(pt: inout Point) -> Point {
        let ret = pt
        pt.x += 1
        pt.y += 1
        return ret
    }
}

var p4 = Point(x: 1.0, y: 2.0)
let p5 = p4++
p5.x // 증가안되어 있음.
p4.x // 증가되어 있음.


prefix operator +++

extension Int {
    static prefix func +++(num: inout Int) {
        num += 2
    }
}
var aaa = 1
+++aaa

precedencegroup MyPrecede {
    //덧셈보다는 우선순위 높음.
    higherThan: AdditionPrecedence
}


infix operator *+* :MyPrecede

extension Int {
    static func *+*(left: Int, right: Int) -> Int {
        return left * right + left * right
    }
}

1 *+* 2 + 3 //오류발생 우선순위를 정해주지 않아서.. ==>:MultiplicationPrecedence or MyPrecedee  이거 넣어주면 곱하기와 같은 급


/*
Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

Example 1:

Input: 2
Output: [0,1,1]
Example 2:

Input: 5
Output: [0,1,1,2,1,2]
*/
    func countBits(_ num: Int) -> [Int] {
        var twoSquareNumber = 1
        var reCycleNumber = 1
        var result:[Int] = []
        for x in 0...num {
            if x == 0 {
                result.append(0)
            } else if x == 1 {
                result.append(1)
            } else {
                if x % twoSquareNumber == 0 {
                    result.append(1)
                    twoSquareNumber *= 2
                    reCycleNumber = 1
                } else {
                    result.append(1 + result[reCycleNumber])
                    reCycleNumber += 1

                }
            }
            
        }
        
        return result
}
let a1 = (0...4).map{$0.nonzeroBitCount}
countBits(5)




