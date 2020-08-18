//
//  ViewController.swift
//  AccessControlUsingCustomFrameWork
//
//  Created by brian on 18/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit
import BrianJFrameWork

/*
 모듈: 코드배포의 단일 유닛 -> import 사용
 소스파일: 모듈내의 단일 Swift소스 코드 파일(앱 또는 프레임워크의 단일 파일) ex) viewcontroller.swift
 
 Access Levels
 open
 public:
  외부 모듈에서 사용가능
----------------------------------------------
  외부 모듈에서 사용불가능
 internal: 해당 모듈내에서만 정의된 엔티티 사용가능
 fileprivate
 .File-private은 같은 모듈이어도 다른 소스파일이면 접근이 안되는거죠. 오직 그 File-private을 정의한 소스파일내에서만 사용이 가능합니다.

 private
 "private접근은 엔티티의 사용을  enclosing 선언(enclosing declaration)과 동일한 파일에 있는 해당 선언의 extension으로 제한합니다."
 
 소스코드
 class -> open 부터 가능
 struct,enum -> public 부터 가능
 

 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = OpenClass()
        let b = PublicClass()
//        a.someInternalMethod() --> 외부모듈에서 접근불가능
        print("완료")
    }


}

//오픈만 상속(서브클래싱) 가능
//오픈만 override 가능 -> 서브클래스에서는 부모클래스에서 상속받은 것을 재정의

class SubClass: OpenClass {
    
}

// public 부터는 상속/오버라이드 불가.
//class SubClass2222: PublicClass {
//    override func someMethod() {
//        print("hello world")
//    }
//}


//fileprivate
fileprivate class Subfileprivate {
   public init() {}
}

fileprivate let file22 = Subfileprivate()


//private
private class SubPrivate {
   public init() {}
   private var name = "Brian"
}

// init이 public 이므로. 오케이 --> fileprivate 이여도 만들어지긴 함. swift 3에서는 오류/ swift 4에서 가능!
private let someInstance = SubPrivate()

// 동일한 파일에 있는 해당 선언의 extension 으로 제한!!
extension SubPrivate{
    func someMethod(){
        print(name)//OK
    }

}





// 여긴 오버라이드관련
class Vehicle {
    var h = 10
    func makeNoise() {
        h = 100
        print("비히클에서 발생합니다~")
        print("hhh :",h)
    }
   final func noneOveride() {
        print("final 키워드는 오버라이드 못하게하는 것")
    }
}

class Train: Vehicle {
    override func makeNoise() {
        print("여기는 트레인!")
        print("adfadfadf :,",h)
    }
//    override func noneOveride() {} -> 오버라이드 불가
    
}


