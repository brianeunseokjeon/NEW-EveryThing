//
//  ViewController.swift
//  SemiCircleLinePath
//
//  Created by brian on 20/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    let ge = LineCircleView()
    let lineWidth: CGFloat = 16
    let boxWidth: CGFloat = 5
    let toothAngle: CGFloat = 5
    let boxHeight: CGFloat = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(ge)
        ge.translatesAutoresizingMaskIntoConstraints = false
        ge.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ge.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ge.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        ge.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        ge.backgroundColor = #colorLiteral(red: 0.184106946, green: 0.465429008, blue: 1, alpha: 1)

     

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        ge.setNeedsDisplay()

    }

}

