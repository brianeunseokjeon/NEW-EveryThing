import UIKit
/*:
 # 메모리 릭
 ## 특히 클로저만 살펴보자
 */


//TestClass가 aBlock을 가지고 있고, aBlock이 클로저에서 self를 캡쳐한 상황이다. 그래서 init함수가 종료되어도 사라지지 않음.. 강함참조 발생하는 경우
class TestClass{
    var aBlock: (()->())? = nil
    let aConstant = 5
    
    init(){
        print("init")
        aBlock = {
            print(self.aConstant)
        }
    }
    deinit {
        print("deinit")
    }
}

var testClass: TestClass? = TestClass()
testClass = nil


//강한참조 발생안함
//이경우는 위의 경우와 다르다! 일단 클래스가 aBlock이 클래스에 저장되어 있지 않음. init함수가 불리울때 처음으로 생성후 함수가 종료되자마자 사라짐. 클로져를 locally하게 사용하면 문제되지 않음.. 더 자세한 예시는 밑!
class TestClass2 {
    let aConstant = 5
    
    init() {
        print("init")
        let aBlock = {
            print(self.aConstant)
        }
    }
    deinit {
        print("deinit")
    }
}
var testClass2: TestClass2? = TestClass2()
testClass2 = nil


//우리가 흔히 볼수 있는 예시이다.
// 블록 자체는 블록 내부에서 self, 즉 TestClass 객체를 강하게 참조하지만 Closure자체는 메소드 지역안에 존재하기 때문에 메소드가 return되면 메모리에서 해제됩니다.
class TestClass3{
    let aConstant = 5
    
    init(){
        print("init")
    }
    deinit {
        print("deinit TestClass3")
    }
    func doSomething(){
        UIView.animate(withDuration: 5){
            let aConstant = self.aConstant
            
            // fancy animation ... .
        }
    }
}

var testClass3: TestClass3? = TestClass3()
testClass3?.doSomething()
testClass3 = nil


//클로저에 관한 메모리릭은 제일 이해가지 않았던 부분이다. 하지만 https://baked-corn.tistory.com/30 의 블로그를 보고 이해 할수 있었다.
