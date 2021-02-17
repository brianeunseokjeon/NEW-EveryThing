import UIKit

/* 옵셔널 관련
1. What is an optional and which problem do optionals solve?

 Optional 에서 ExpressibleByNilLiteral protocol을 준수
 
 ExpressibleByXLiteral protocol 은 X 타입 리터럴로 초기화될 수 있는 타입의 자격요건을 명시한다. ExpressibleByNilLiteral 은 nil로 초기화될 수 있는 타입, ExpressibleByStringLiteral 은 string literal로 초기화 될 수 있는 타입에서 준수한다.
 그동안 변수를 선언할 때, 그저 숫자, 혹은 문자열 리터럴만 넣어주면 Int, String 타입으로 자동으로 type inference 가 되었다. 이를 가능하게 하는 것이 ExpressibleByXLiteral protocol 구현 덕이다.
 
 */

var 옵셔널쓰는법:Optional<Int> = nil
var 옵셔널표현:Int? = 3

var 옵셔널스트링 : String? = "Test"
let 첫번째방법은강제언레핑: String = 옵셔널스트링!
var 두번째방법은강제언레핑인데타입없이 = 옵셔널스트링!
if let 세번째방법은옵셔널바인딩 = 옵셔널스트링 {
  print("x was successfully unwrapped and is = \(세번째방법은옵셔널바인딩)")
}
let 네번째방법은옵셔널체이닝 = 옵셔널스트링?.count
let 다섯번째방법은NilCoalescingOperator = 옵셔널스트링 ?? ""
//guard let 여섯번째는가드문 = 옵셔널스트링 else { return }
if case let 일곱번째방법? = 옵셔널스트링 {
  print(일곱번째방법)
}

/*
 if case let x = y {
    ...
 }
 // 위 구문은 풀어서 쓰면 다음과 같습니다
 switch y {
 case let x: ...
 default: ()
 }
 */

/*
 2. Summarize the main differences between a structure and a class.

 struct
 1. call by value (할당 또는 파라메터 전달시 value copy가 일어남)
 2.  stack memory 영역에 할당 (속도가 빠름)
 3. scope based lifetime: 컴파일타임에 compiler가 언제 메모리를 할당/해제할지 정확히 알고있음
 4. data locality: CPU 캐시 히트율이 높음
 5. 상속 불가능 (protocol은 사용 가능)
 6. NSData로 serialize 불가능
 7. Codable 프로토콜을 이용하여 손쉬운 JSON <-> struct 변환 가능 (Swift 4 이상)
 항상 새로운 변수로 copy가 일어나기때문에 multi-thread 환경에서 공유변수로 인해 문제를 일으킬 확률이 적음 1
 
 
 class
 1. call by reference (할당 또는 파라메터 전달시 객체를 가리키고있는 메모리 주소값만 복사됨)
 2. heap memory 영역에 할당 (속도가 느림)
 3. 런타임에 직접 alloc하며 reference counting을 통해 dealloc이 필요
 4.memory fragmentation 등의 overhead가 존재
 5. 상속 가능
 6. NSData serialize 가능
 7. Codable 사용 불가능
 8. 런타임에 타입 캐스팅을 통해서 클래스 인스턴스에 따라 여러 동작이 가능
 9. deinitializer 존재
 
 
 참고: class안에 struct 변수를 property로 정의하는것 가능하며, 반대로 struct의 property중 하나로 class 인스턴스 변수를 갖고있는 것도 가능하다. 이 경우 해당 struct 변수의 copy가 일어날때 class 인스턴스의 주소값만 복사된다.
 
 추가 참고자료: 2
 위의 technical한 차이점들을 종합하여 정리해 봤을 때 어떤상황에 어떻게 써야하는지 간단히 룰을 만들어보면 다음과 같다.

 상속이 필요하지 않고 모델의 사이즈가 그리 크지 않다면 struct를 사용
 JSON의 필드와 1:1 mapping되는 간단한 모델이 필요하다면 struct를 사용 (JSON대신 다른 데이터 encoder/decoder를 구현가능하지만 Swift에서는 JSON만 제공됨)
 해당모델을 serialize 해서 전송하거나 파일로 저장할 일이 있다면 class 사용
 해당 모델이 Obj-C에서도 사용되어야 한다면 class 사용
 
 
 
 결론
 You can summarize the differences as:

 Classes support inheritance; structures don't.
 Classes are reference types; structures are value types.
 */


/* 제네릭
 3. What are generics and which problem do they solve?

 제네릭 코드(Generic code)는 정의한 요구사항에 따라 모든 타입에서 작업 할수 있는 유연하고 재사용 가능한 함수나 타입을 작성할 수 있습니다. 중복을 피하고 의도가 명확하게 표현하는 코드를 작성할 수 있으며 추상적으로 관리합니다.

 제네릭은 Swift에서 가장 강력한 기능중 하나이고, Swift의 표준 라이브러리 대부분이 제네릭 코드로 만들어졌다. 사실상, 모른다고 하더라도, 언어 가이드(Language Guide) 전체에서 제네릭을 사용해 왔습니다. 예를들어, Swift의 Array와 Dictionary타입 모두 제네릭 컬렉션입니다. Swift에서 Int값이나 String값을 가지는 배열을 만들수 있거나 실제 Swift에서 만들수 있는 다른 타입을 가지는 배열을 만들수 있습니다. 비슷하게, 모든 특정 타입의 값을 저장하는 딕셔너리를 만들 수 있고, 타입이 무엇인지에 대한 제한은 없습니다.
 
 
 
 
 */
/* 프로토콜에서의 제네릭 Associated Types

프로토콜을 정의할때, 가끔씩 프로토콜의 선언에서 하나 이상의 연관된 타입을 선언하는게 유용합니다. 연관된 타입(associated type)은 프로토콜에서 사용되는 타입의 견본(placeholder) 이름을 줍니다. 연관된 타입에 사용할 실제 타입은 프로토콜이 적용될때가지 지정되지 않습니다. 연관된 타입은 associatedtype키워드로 지정됩니다.
*/
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}



