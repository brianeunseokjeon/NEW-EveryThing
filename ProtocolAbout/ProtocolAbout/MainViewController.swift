//
//  MainViewController.swift
//  ProtocolAbout
//
//  Created by brian은석 on 2021/02/01.
//

import UIKit

class MainViewController: UIViewController,PresenterHelper {
    func helpPresent() {
        let vc = ViewController2()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    let v = UICustomView()
    let b = UIButton()
    
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
        
        view.addSubview(b)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        b.heightAnchor.constraint(equalToConstant: 100).isActive = true

        b.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 100).isActive = true
        b.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -100).isActive = true
        b.backgroundColor = .gray
        b.addTarget(self, action: #selector(di), for: .touchUpInside)
    }
    @objc func di() {
        dismiss(animated: true, completion: nil)
    }


    deinit {
        print("사라진다 MainViewController")
    }
}
