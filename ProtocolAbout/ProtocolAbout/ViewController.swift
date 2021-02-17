//
//  ViewController.swift
//  ProtocolAbout
//
//  Created by brian은석 on 2021/02/01.
//

import UIKit

protocol PresenterHelper: class {
    func helpPresent()
}

class ViewController: UIViewController,PresenterHelper {
    func helpPresent() {
        let vc = MainViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    let v = UICustomView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100).isActive = true
        v.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -100).isActive = true
        v.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 100).isActive = true
        v.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -100).isActive = true
        v.backgroundColor = .red
        v.delegate = self
    }


    deinit {
        print("사라진다 ViewController")
    }
}

