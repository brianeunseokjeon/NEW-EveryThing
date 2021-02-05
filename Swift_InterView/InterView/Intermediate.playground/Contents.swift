import UIKit

/* 옵셔널
 1. What's the difference between nil and .none?
 ---> 같다
 */

var 옵셔널:Int? = 1
옵셔널 = .none
옵셔널 = nil

/* class vs struct
 2. Here's a model of a thermometer as a class and a struct. The compiler will complain about the last line. Why does it fail to compile?
 */
public class ThermometerClass {
  private(set) var temperature: Double = 0.0
  public func registerTemperature(_ temperature: Double) {
    self.temperature = temperature
  }
}

let thermometerClass = ThermometerClass()
thermometerClass.registerTemperature(56.0)

public struct ThermometerStruct {
  private(set) var temperature: Double = 0.0
  public mutating func registerTemperature(_ temperature: Double) {
    self.temperature = temperature
  }
}

let thermometerStruct = ThermometerStruct()
//thermometerStruct.registerTemperature(56.0)


/* closure 캡쳐
 3. What will this code print and why?
 */
var thing = "cars"

let closure = { [thing] in
  print("I love \(thing)")
}

thing = "airplanes"

closure()



/* extension
 4. Here's a global function that counts the number of unique values in an array:
  
 */

extension Array where Element: Comparable {
  func countUniques() -> Int {
    let sortedValues = self.sorted()
    
    let initial: (Element?, Int) = (.none, 0)
    let reduced = sortedValues.reduce(initial) {
        print("$0 :",$0,"$1",$1)
     return ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
    }
    return reduced.1
  }
}

[1,19,4,11,6,4].reduce(0, { s1,s2 -> Int in
    print(s1,s2)
    return s1+s2
})


/* 5. static / class 차이
  static 은 상속못함
 
  struct 는 상속기능없음. 그래서 함수에 static 사용 class 사용시 오류
  class 는 상속가능 -> static : 상속불가능 / class 상속 가능
 */
class Star {
  class func spin() {}
  static func illuminate() {}
}
class Sun : Star {
  override class func spin() {
    super.spin()
  }
  // error: class method overrides a 'final' class method
//  override static func illuminate() {
//    super.illuminate()
//  }
}
//struct Sun {
//    class func illuminate() {}
//}


/* 6. Can you add a stored property to a type by using an extension? How or why not?
 
--No, it's not possible. You can use an extension to add new behavior to an existing type, but not to alter either the type itself or its interface. If you add a stored property, you'd need extra memory to store the new value. An extension cannot manage such a task.
 
 불가능 -> 저장프로퍼티를 추가하려면 새 값을 저장하는 추가 메모리가 있어야하는데 extension은 그걸 관리할수없음
 */


/* 프로토콜
 
 프로토콜은 메서드, 속성 및 기타 요구 사항의 청사진을 정의하는 유형입니다. 그런 다음 클래스, 구조 또는 열거가 이러한 요구 사항을 구현하기 위해 프로토콜을 채택 할 수 있습니다.

 프로토콜의 요구 사항을 채택하는 유형은 해당 프로토콜을 준수합니다. 프로토콜은 기능 자체를 구현하지 않고 기능을 정의합니다. 프로토콜을 확장하여 일부 요구 사항의 기본 구현 또는 형식을 준수 할 수있는 추가 기능을 제공 할 수 있습니다.
 
 
 프로퍼티: 프로토콜에서는 프로퍼티가 저장프로퍼티인지 연산프로퍼티인지 명시하지 않고, 이름과 타입 그리고 gettable, settable한지 명시한다. (프로퍼티는 항상 var로 선언해야 한다.)
 
 메서드 : 프로토콜에서는 인스턴스 메소드와 타입 메소드를 정의할 수 있다. 하지만 메소드 파라미터의 기본 값은 프로토콜 안에서 사용할 수 없다.
 메소드를 정의할 때 함수명과 반환값을 지정할 수 있고, {}는 적지 않는다.
 mutating 키워드를 사용해 인스턴스에서 변경 가능하다는 것을 표시할 수 있다. (값 타입에서만 사용 가능)
 
 < Obective-C >
 단지 기능의 청사진의 역할을 수행
 주로 Delegate, DataSource 등으로 이용
 기본 구현 (Default Implementation) 불가 (ex. 카테고리 적용 불가)
 < Swift >
 Objective-C의 프로토콜 기능은 기본
 기본 구현(Default Implementation) 가능
 Protocol + Extension = Protocol extension
 특정 타입이 할 일 지정 + 구현을 한 방에!
 Protocol extension

 Protocol default implimentation: 프로토콜을 따르겠다고 선언만 하면 어디서든 해당 프로토콜의 기능을 사용할 수 있음
 
 Protocol을 만들게 된 배경 idea
 1. 상속의 한계: 서로 다른 클래스에서 상속받은 클래스는 동일한 기능을 구현하기 위해 중복코드 발생 -> Protocol default implimentation으로 해결
 2. 카테고리의 한계: 프로퍼티 추가 불가, 오직 클래스에만 적용 가능, 기존 메서드를 (자신도 모르게) 오버라이드 가능 -> Protocol default implimentation으로 해결
 3. 참조타입의 한계: 동적 할당과 참조 카운팅에 많은 자원 소모 -> Value Type으로 해결

 */
struct Content {
    var URLString:String
    var note:String
}

protocol MediaContainer: class {
    var content: Content? { get set }
    var media: UIImageView { get }
    var note: UILabel { get set }

    func contentChanged()
}

extension MediaContainer {
    func contentChanged() {
        // Update view...
        media.image = UIImage(named: content!.URLString)
        note.text = content?.note
    }
}

class TimelineTableViewCell: UITableViewCell,
    MediaContainer {
    var media: UIImageView = UIImageView()
    var note: UILabel = UILabel()
    var content: Content? {
        didSet {
            contentChanged()
        }
    }
}



/* Literal(Integer,Floatin-Point,String,Boolean..등)
 https://ontheswift.tistory.com/25
 Expressible@@@Literal
 -> 우리가 let a = Int(1)이 아니라, let a = 1 로 쓸수있는이유!!
    우리가 let b = String("a")이 아니라, let b = "a" 로 쓸수있는 이유
 커스텀 struct 도 위의 방식처럼 쓰기위한 방법
 */


public struct Thermometer {
  public var temperature: Double
  public init(temperature: Double) {
    self.temperature = temperature
  }
}
var t: Thermometer = Thermometer(temperature:56.8)
//var thermometer: Thermometer = 56.8
extension Thermometer: ExpressibleByFloatLiteral {
  public init(floatLiteral value: FloatLiteralType) {
    self.init(temperature: value)
  }
}
var thermometer: Thermometer = 56.8



