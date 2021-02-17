import UIKit

/*
 컴파일 / 런타임 언제언제?
 일반적 컴파일시 에러
 정적(static) -> swift 소스 코드에서 작동
 컴파일러는 명시적으로 언급되고 유추된 유형을 살펴보고 유형 제약조건의 정확성을 보장
 Syntax errors
 Typechecking errors
 Compiler crashes (Rarely)
 
 동적(dynamic)
 
 Division by zero
 Dereferencing a null pointer
 Running out of memory
 
 */
protocol HasName {}
protocol HumanType {}

struct User: HasName, HumanType { }
struct Visitor: HasName, HumanType { }
struct Car: HasName {}

// Require a type that is both human and provides a name
func printHumanName<T: HumanType & HasName>(thing: T) {
    // ...
}
printHumanName(thing: User())
// Compiles fine:
printHumanName(thing: Visitor())
// Compile Error: cannot invoke 'printHumanName' with an
// argument list of type '(Car)'
//printHumanName(thing: Car())


/*
 컴파일 속도를 향상시켜보자
 https://medium.com/marojuns-ios/swift-%EC%BB%B4%ED%8C%8C%EC%9D%BC-%EC%86%8D%EB%8F%84%EB%A5%BC-%ED%96%A5%EC%83%81%EC%8B%9C%ED%82%A4%EC%9E%90-51617509e35
   
 */
//1. 변수에 타입을 지정

let array: [String] = ["s"]


//2.다른 큰 향상방법은 Nil-Coalescing operator(nil병합연산자) 를 사용하지 않는것이다.
var 예시스트링:String? = nil

if let 좋은예시 = 예시스트링{
   /* string has value */
}else{
   /* string is nil*/
}
let 나쁜병합연산자 = 예시스트링 ?? ""


//3. 삼항연산자를 사용하지 말아라
//4. 문자열 합칠때, +를 사용하지말아라
let 좋은예시URL = "https://google.com/\("path")/\("anotherpath")"
let 나쁜예시URL = "https://google.com/" + "path/" + "anotherpath"

//5. 조건문의 비교값에 연산을 넣지 않는다
let 좋은숫자예시 = 3000
let 나쁜숫자예시 = 60 * 60
if 좋은숫자예시 == 3600{}
if 나쁜숫자예시 == 60 * 60 {}
