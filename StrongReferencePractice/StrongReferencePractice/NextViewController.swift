//
//  NextViewController.swift
//  StrongReferencePractice
//
//  Created by brian은석 on 2021/01/12.
//

import UIKit

class NextViewController: UIViewController {

    var myCount = 1
    let custom = IncludeDissmissButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        makeUI()
        custom.viewcontroller = self
    }

    func makeUI() {
        view.addSubview(custom)
        custom.translatesAutoresizingMaskIntoConstraints = false
        custom.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        custom.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        custom.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        custom.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        custom.backgroundColor = .white
    }
    
    deinit {
        print("사라진다222222222")
    }
}
