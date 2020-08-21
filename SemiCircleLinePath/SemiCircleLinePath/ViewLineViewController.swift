//
//  ViewLineViewController.swift
//  SemiCircleLinePath
//
//  Created by brian on 21/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class ViewLineViewController: UIViewController {

    let diaView = UIView()
        let lineWidth: CGFloat = 6
        let lineHeight: CGFloat = 20
        let numberOfLines = 36
        let w:CGFloat = 300
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(diaView)
            diaView.frame = CGRect(x: 50, y: 200, width: w, height: 300)
        
            for n in 0..<numberOfLines {
                let lineView = UIView()
                lineView.frame = CGRect(x: (w-lineWidth)/2, y: (300-lineHeight)/2, width: lineWidth, height: lineHeight)
                lineView.backgroundColor = .red
                diaView.addSubview(lineView)
    //            print(diaView.center)
                let rotate = CGAffineTransform(rotationAngle: radians(input: (360/numberOfLines)*n))
    //            rotate.concatenating(<#T##t2: CGAffineTransform##CGAffineTransform#>).concatenating(<#T##t2: CGAffineTransform##CGAffineTransform#>)
                lineView.transform = CGAffineTransform(rotationAngle: radians(input: (360/numberOfLines)*n))
    //            lineView.transform = CGAffineTransform(translationX: diaView.center.x, y: diaView.center.y)
            }
            
        }
        func radians(input:Int) -> CGFloat {
            return (CGFloat.pi * CGFloat(input))/180
        }

}
