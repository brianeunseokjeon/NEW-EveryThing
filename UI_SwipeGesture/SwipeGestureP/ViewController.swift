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
    
    @IBOutlet var mainSideImageViews: [UIImageView]!
    var model: [UIColor] = [.red,.blue,.brown,.cyan]
    var gesLeft: UISwipeGestureRecognizer!
    var gesRight: UISwipeGestureRecognizer!
    
    let centerImages:[[UIImage]] = [[#imageLiteral(resourceName: "illust03"),#imageLiteral(resourceName: "illust01")],[#imageLiteral(resourceName: "illust02"),#imageLiteral(resourceName: "illust04")],[#imageLiteral(resourceName: "illust03"),#imageLiteral(resourceName: "illust04")],[#imageLiteral(resourceName: "illust03"),#imageLiteral(resourceName: "illust01")]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainSideImageViews[0].image = UIImage(named: "illust01")
        mainSideImageViews[1].image = UIImage(named: "illust02")

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
            ani(disappearPoint: -20, appearPoint: 40, resultPoint: -20, tag: currentTag)
        } else if sender.direction == .right && currentTag > 0 {
            currentTag -= 1
            btnAction(boxes[currentTag])
            ani(disappearPoint: 20, appearPoint: -40, resultPoint: 20, tag: currentTag)

        }
        
        print(currentTag)
        
    }
    
    func ani(disappearPoint:CGFloat,appearPoint:CGFloat,resultPoint:CGFloat,tag:Int) {
        UIView.animate(withDuration: 0.3, animations: {
            self.mainSideImageViews.forEach{
                $0.frame.origin.x += disappearPoint
                $0.alpha = 0
            }
        }) { (isOver) in
            self.mainSideImageViews.forEach{
                $0.frame.origin.x += appearPoint
            }
            self.mainSideImageViews[0].image = self.centerImages[tag][0]
            self.mainSideImageViews[1].image = self.centerImages[tag][1]

            UIView.animate(withDuration: 0.3) {
                self.mainSideImageViews.forEach{
                    $0.frame.origin.x += resultPoint
                    $0.alpha = 1
                }
            }
        }
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

