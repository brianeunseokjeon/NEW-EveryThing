//
//  CustomProgressView.swift
//  CustomProgressView
//
//  Created by brian on 10/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit


class CustomProgressView: UIView {
    var currentCount = 8000
   private var progress: Progress!
    
   private let progressView = UIProgressView()
   private let imageView = UIImageView()
    
   private let startPointLabel = UILabel()
   private let middlePointLabel = UILabel()
   private let currentPointLabel = UILabel()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(totalCount:Int) {
        super.init(frame: UIScreen.main.bounds)
        progress = Progress(totalUnitCount: changeToUnitCount(input: totalCount))
        progress.completedUnitCount = changeToUnitCount(input: currentCount)
    }

    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
         makeUI()
    }
    
    
    private func makeUI() {
        self.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        progressView.transform = CGAffineTransform(scaleX: 1, y: 5)
        progressView.setProgress(Float(progress.fractionCompleted), animated: false)
        
        
        let gradientImage = UIImage.gradientImage(with: self.bounds,
                                                  colors: [#colorLiteral(red: 1, green: 0.7342318892, blue: 0.8967689872, alpha: 1), #colorLiteral(red: 0.8416540027, green: 0.4411469102, blue: 0.5920034051, alpha: 1)],
                                                  locations: nil)
        progressView.progressImage = gradientImage!

        
        self.addSubview(startPointLabel)
        self.startPointLabel.translatesAutoresizingMaskIntoConstraints = false
        self.startPointLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor,constant: -2).isActive = true
        self.startPointLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        startPointLabel.text = "0"
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: progressView.bottomAnchor,constant: 3).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.size.width * CGFloat(progress.fractionCompleted)-20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        imageView.image = UIImage(named: "arrow")
        
        imageView.tintColor = .red // rendering -> templete -> asset에서 바꿀수 있음
        
        self.addSubview(currentPointLabel)
        currentPointLabel.translatesAutoresizingMaskIntoConstraints = false
        currentPointLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor,constant: 5).isActive = true
        currentPointLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        currentPointLabel.text = "\(currentCount)"
    }
    

   private func changeToUnitCount(input:Int) -> Int64 {
        return Int64(input / 100)
    }

    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
fileprivate extension UIImage {
    static func gradientImage(with bounds: CGRect,
                            colors: [CGColor],
                            locations: [NSNumber]?) -> UIImage? {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        // This makes it horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0,y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,y: 0.5)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
