//
//  ViewController.swift
//  CustomProgressView
//
//  Created by brian on 10/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let progress = CustomProgressView(totalCount: 8000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progress)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.topAnchor.constraint(equalTo: view.topAnchor,constant: 200).isActive = true
        progress.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        progress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
}

