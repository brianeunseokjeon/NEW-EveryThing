import UIKit


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount

        return runningTotal
    }
    return incrementer
}

let capture = makeIncrementer(forIncrement: 5)
//capture()
//capture()
//capture()


//2탄 demo1 함수가 끝나도 pokemon의 객체는 사라지지 않고 있음. 왜냐하면 delay의 escaping 클로저속에 pokemon객체가 살아있음. rc = 1  상황. 그래서 escaping 클로저도 끝나고 사라짐.
class Pokemon {
  var name: String
  init(name: String) {
    self.name = name
  }
    deinit { print("\(self.name) escaped!") }
}

struct StructPokemon {
    var name: String
    init(name: String) {
        self.name = name
    }
}

func delay(_ seconds: Int, closure: @escaping ()->()) {
    print("delay로 들어왔습니다.") //step2
  let time = DispatchTime.now() + .seconds(seconds)
  DispatchQueue.main.asyncAfter(deadline: time) {
    print("🕑") //step5
    closure()
  }
    print("delay 일단 종료") //step3
}
func demo1() {
  let pokemon = Pokemon(name: "Mewtwo")
    print("before closure: \(pokemon.name)") //step1
  delay(1) {
    print("inside closure: \(pokemon.name)") //step6
  }
  print("bye")//step4

}
//함수는 종료되었지만, 포켓몬 객체는 살아있음 -> step6에야 포켓몬 객체 사라짐.
demo1()

//3탄 이걸통해서 캡쳐 시점을 알수 있음.
func demo2() {
  var pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon.name)") //step1
  delay(1) {
    print("inside closure: \(pokemon.name)") //step6
  }
  pokemon = Pokemon(name: "Mewtwo")
    print("after closure: \(pokemon.name)") // step4
}

//step5 일때 포켓몬 객체를 갭쳐함. 그때는 뮤츠로 바꾼 상태이므로 뮤츠가 나오는것.
//demo2()

//4탄 이걸 통해서 미리 캡쳐할수 있음
func demo3() {
    var pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon.name)") //step1
    delay(1) { [pokemon] in
        print("inside closure: \(pokemon.name)") //step6
    }
    pokemon = Pokemon(name: "Mewtwo")
    print("after closure: \(pokemon.name)") //step4
}
// step 3 이후에 포켓몬 객체를 캡쳐하므로, 그때의 포켓몬은 피카츄임. 그래서 후에 뮤츠로 바꼈어도, 피카츄객체는 살아있고, 뮤츠객체는 생성되었다가 사라짐. //사실 여기 캡쳐했다는 부분이 정확히 어떻게 구현되는지 상상이 안감; 뮤츠객체가 포켓몬들어갔다가 사라지고(deinit) 그 비어있는곳에 피카츄 객체가 다시 들어가는건가?? 모르겠음;;
//demo3()

//5탄 value 타입일경우와 래퍼런스 타입의 차이!! --> 값타입은 캡쳐당시 값을 복사하기에 뒷부분에서 속성을 변경하더라도 또하나의 객체를 복사한 상태이기에 클로저속의 객체는 새로운 객체.. 이름변경해도 영향을 미치지 않음.
func demoValueType() {
    var pokemon = StructPokemon(name: "Pikachu")
    print("before closure: \(pokemon.name)")
    delay(1) { [pokemon] in
        print("inside closure: \(pokemon.name)")
    }
    pokemon.name = "Mewtwo"
    print("after closure: \(pokemon.name)")
}

// Reference 타입일경우. 이름 변경시.. -> 래퍼런스이기때문에 주소를 캡쳐하기에 속성에 변화에 영향을 미침.
func demoReferenceType() {
    let pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon.name)")
    delay(1) { [pokemon] in
        print("inside closure: \(pokemon.name)")
    }
    pokemon.name = "Mewtwo"
    print("after closure: \(pokemon.name)")
}

//demoReferenceType()


//야곰의 질문?
func biggerOne(_ a : Int, _ b : Int) -> Int? {
    if a == b {
        return nil
    } else if a > b {
        return a
    } else {
        return b
    }
}

//1.default capture semantic

//var someClosure : (Int, Int) -> Int? = biggerOne(_:_:)
//
//someClosure = { (left : Int, right : Int) in
//    someClosure(left , right)
//}
//print(someClosure(2,3)!)  //이거 그대로 할경우 런타임 에러남.
var solutionClosure : (Int, Int) -> Int? = biggerOne(_:_:)
solutionClosure = { [solutionClosure] (left : Int, right : Int) in
    solutionClosure(left , right)
}
//print(solutionClosure(2,3)!)



//출처
//https://velog.io/@kimdo2297/%ED%81%B4%EB%A1%9C%EC%A0%B8-%EC%BA%A1%EC%B3%90%EC%97%90-%EB%8C%80%ED%95%B4%EC%84%9C-about-closure-capture


//관련 escaping Closure
//self 키워드를 명시적으로 사용해야 하는 것은 탈출 클로저에만 해당합니다. self를 명시함으로써 함수가 return한 후에도 탈출한 클로저가 어떤 객체를 참조하고 있는지 기억하기 위함이지요. 비탈출 클로저의 경우 self 키워드 사용은 선택 사항입니다. 그리고 self를 weak으로 참조할지 strong으로 참조할지는 별개의 문제인 것 같습니다.

// 이번예시는 단순히 escaping이 쓰이는 경우를 크게 두가지로 표현한듯.
// 함수의 파라미터를
var complitionHandler: ((Int)->Void)?

func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
    //step 2
    var sum: Int = 0
    for value in array {
        sum += value
    }
    //step 3
    complitionHandler = handler
    print("합을 구ㅏㅎㄴ다",sum)
}

func doSomething() {
    //step 1
   getSumOf(array: [16,756,442,6,23]) { (sum) in
        print("이게 불리는구나",sum)
        //step 4. 함수 종료
    }
}

//complitionHandler!(342) // 여기서 부를경우 오류남. 당근 실행전이니깐..
doSomething() // 실행할경우  step4 까지 진행못함. step3에서 끝. 단순히 외부에 저장만 한것뿐.
complitionHandler!(342) // 올바르게 실행됨.




//출처: https://oaksong.github.io/2018/03/02/escaping-closure/
