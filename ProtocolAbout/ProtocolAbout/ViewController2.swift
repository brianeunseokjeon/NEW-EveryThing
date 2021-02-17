//
//  ViewController2.swift
//  ProtocolAbout
//
//  Created by brian은석 on 2021/02/01.
//

import UIKit

class ViewController2: UIViewController {
    private let v = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100).isActive = true
        v.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -100).isActive = true
        v.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 100).isActive = true
        v.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -100).isActive = true
        v.backgroundColor = .red
        v.addTarget(self, action: #selector(di), for: .touchUpInside)
    }
    @objc func di() {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
