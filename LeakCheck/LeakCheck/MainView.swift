//
//  MainView.swift
//  LeakCheck
//
//  Created by Brian on 13/05/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class MainView: UIView {

    var button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    weak var controller: ViewController?
    
    override func draw(_ rect: CGRect) {
        print(#function)
        makeUI()
    }

   private func makeUI() {
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false

        button1.topAnchor.constraint(equalTo: self.topAnchor, constant: 120).isActive = true
        button1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        button1.setTitle("11111", for: .normal)
        button1.backgroundColor = .blue
    button1.addTarget(self, action: #selector(act), for: .touchUpInside)
        
        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 40).isActive = true
        button2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button2.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        button2.setTitle("2222222", for: .normal)
        button2.backgroundColor = .blue

        
        button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 40).isActive = true
        button3.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button3.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        button3.setTitle("3333333", for: .normal)
        button3.backgroundColor = .blue


    }
    
    func configureUI(first:String,second:String,third:String) {
        button1.setTitle(first, for: .normal)
        button2.setTitle(second, for: .normal)
        button3.setTitle(third, for: .normal)

    }
    
    @objc func act() {
        print("view에서 디스미스")
        controller?.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinit MainView")
    }

}
