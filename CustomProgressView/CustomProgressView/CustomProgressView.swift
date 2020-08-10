//
//  CustomProgressView.swift
//  CustomProgressView
//
//  Created by brian on 10/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit


class CustomProgressView: UIView {
    var currentCount = 5000
    var totalCount = 0
    var progress: Progress!
    
    let progressView = UIProgressView()
    let imageView = UIImageView()
    
    lazy var pointer:CGFloat = {
        let p = (progressView.frame.width / CGFloat(totalCount/100)) * CGFloat(changeToUnitCount(input: currentCount))
        return p
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(totalCount:Int) {
        super.init(frame: UIScreen.main.bounds)
        self.totalCount = totalCount
        let cmtUnitCount = changeToUnitCount(input: currentCount)
        

        progress = Progress(totalUnitCount: changeToUnitCount(input: totalCount))
        progress.completedUnitCount = cmtUnitCount
        makeUI()
        progressView.setProgress(Float(progress.fractionCompleted), animated: false)
        
        
        progressView.addSubview(imageView)
//        imageView.bounds = CGRect(x: 100, y: 20, width: 50, height: 50)
        imageView.frame = CGRect(x: 100, y: -25, width: 50, height: 10)
        imageView.image = UIImage(named: "arrow")
        imageView.backgroundColor = .red
        print(imageView)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    
    private func makeUI() {
        self.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        progressView.transform = CGAffineTransform(scaleX: 1, y: 5)

    }
    
    
   private func changeToUnitCount(input:Int) -> Int64 {
        return Int64(input / 100)
    }

    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
