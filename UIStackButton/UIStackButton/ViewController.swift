//
//  ViewController.swift
//  UIStackButton
//
//  Created by brian은석 on 2021/04/12.
//

import UIKit

class ViewController: UIViewController {
    let myView = MyStackButtons()
    var padding:CGFloat = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myView.inputText(text:  ["abcdedef","오늘은 날씨가","좋은하루구나","아하","기분이 너무좋아요","11","22222","3333333333333333333333","가죽자켓","1기준1111"])
    }
    
  


}
