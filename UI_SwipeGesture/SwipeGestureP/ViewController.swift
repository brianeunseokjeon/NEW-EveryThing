//
//  ViewController.swift
//  SwipeGestureP
//
//  Created by brian은석 on 2020/09/04.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var containView: UIView!

    @IBOutlet var boxes: [UIButton]!
    
    
    var model: [UIColor] = [.red,.blue,.brown,.cyan]
    var gesLeft: UISwipeGestureRecognizer!
    var gesRight: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gesLeft = UISwipeGestureRecognizer(target: self, action: #selector(gestureAction))
        gesLeft.direction = .left
        containView.addGestureRecognizer(gesLeft)
        
        gesRight = UISwipeGestureRecognizer(target: self, action: #selector(gestureAction))
        gesRight.direction = .right
        containView.addGestureRecognizer(gesRight)

    }
    var currentTag = 0
    @objc func gestureAction(_ sender :UISwipeGestureRecognizer) {
        if sender.direction == .left && currentTag < model.count - 1{
           currentTag += 1
            btnAction(boxes[currentTag])
        } else if sender.direction == .right && currentTag > 0 {
            currentTag -= 1
            btnAction(boxes[currentTag])
        }
        
        print(currentTag)
        
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        containView.backgroundColor = model[sender.tag]
        currentTag = sender.tag
        UIView.animate(withDuration: 0.4) {
            self.indicatorView.frame.origin.x = sender.frame.minX
            self.indicatorView.frame.size.width = sender.frame.width
        }
        
    }
    

}

