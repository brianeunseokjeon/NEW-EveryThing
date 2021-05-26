//
//  ViewController.swift
//  NewAES
//
//  Created by 맥북프로에임메드 on 2021/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(1)
        print(AES256Util.encrypt(string: "mbuid_111"))
        print(2)
    }


}

