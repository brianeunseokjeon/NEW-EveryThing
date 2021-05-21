//
//  ViewController.swift
//  AnimationOfT
//
//  Created by brian on 2021/05/21.
//

import UIKit

class ViewController: UIViewController {

    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "tile00")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        for i in 0..<29 {
            spriteImages.append(UIImage(named: "tile0\(i)")!)
        }
    }
    
    var spriteImages = [UIImage]()
    
    @objc func animate() {
        if imageView.isAnimating == false {
            imageView.animationImages = spriteImages
            imageView.animationDuration = 0.6
            imageView.animationRepeatCount = 1
            imageView.startAnimating()

        } else {
            print("gksms")
        }
    }

}

