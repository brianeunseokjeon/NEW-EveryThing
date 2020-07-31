//
//  ViewController.swift
//  LeakCheck
//
//  Created by Brian on 13/05/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    let mainView = MainView()
    let model = MainModel()
    var saveCloser:(()->())!
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    //escaping 클로저를 따로 변수로 저장하고, 후행클로저에 self가 weak으로 들어가지 않으면 순환 참조.. 메모리 릭남
    //참고로 non escaping 클로저에서는 self를 사용할 필요가없음. escaping클로저는 self를 명시함으로써 함수가 return한 후에도 탈출한 클로저가 어떤 객체를 참조하고 있는지 기억하기 위함
    func escapingCloser(completion:@escaping () -> ()) {
        //클로저 saveCloser 저장.
        saveCloser = completion
        nonEscapingCloser2 {
            //self안써도 됨.
            print(model)
            completion()
        }
    }
    func nonEscapingCloser2(completion:() -> ()) {
        completion()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //메모리 릭 나는 상황 -> 클로저를 변수에 저장 -> 후행클로저안에 self.model self 존재..
        escapingCloser {
            print(self.model)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.end {
            print("???")
            self.mainView.configureUI(first: "\(self.model.items[0])", second: "\(self.model.items[1])", third: "\(self.model.items[2])")
            
        }
        //        mainView.button1.addTarget(self, action: #selector(dis), for: .touchUpInside)
        mainView.button2.addTarget(self, action: #selector(dis), for: .touchUpInside)
        mainView.button3.addTarget(self, action: #selector(dis), for: .touchUpInside)
        mainView.controller = self
        
        
    }
    
    
    @IBAction @objc func dis(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    deinit {
        print("deinit ViewController")
        
    }
}

