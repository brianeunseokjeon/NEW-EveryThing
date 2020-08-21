//
//  LineCircleView.swift
//  SemiCircleLinePath
//
//  Created by brian on 21/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class LineCircleView: UIView {

    
    let lineWidth: CGFloat = 40
    
    let bottomView = UIView()
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.maxX/2, y: self.bounds.maxY/2), radius: self.frame.width/2 - lineWidth, startAngle: .pi, endAngle: .pi*(3/2), clockwise: true)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
            
        let firstColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0.8736622432).cgColor
        firstColor.copy(alpha: 0.2)
        gradient.colors = [firstColor, UIColor.white.cgColor ]
    
        
        let shapeMask = CAShapeLayer()
        shapeMask.path = path.cgPath
        shapeMask.lineWidth = lineWidth
        shapeMask.lineDashPhase = 0
        shapeMask.lineDashPattern = [ 3, 9 ]
//        shapeMask.lineCap = .butt
//        shapeMask.lineJoin = .bevel
        shapeMask.strokeColor = UIColor.black.cgColor   //  Any color
        shapeMask.fillColor = nil
        gradient.mask = shapeMask
        layer.addSublayer(gradient)
        

        let containPath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.maxX/2, y: self.bounds.maxY/2), radius: self.frame.width/2 - lineWidth, startAngle: .pi*(11/12), endAngle: .pi*(25/12), clockwise: true)
        containPath.lineWidth = lineWidth
        let containColor = #colorLiteral(red: 0.9753335118, green: 0.9695350528, blue: 0.9797903895, alpha: 0.11)
        UIColor.setStroke(containColor)()
        containPath.stroke()
        
        //
        let path2 = UIBezierPath(arcCenter: CGPoint(x: self.bounds.maxX/2, y: self.bounds.maxY/2), radius: self.frame.width/2 - lineWidth*(3/2), startAngle: .pi*(11/12), endAngle: .pi*(25/12), clockwise: true)
        path2.close()
        
        let bottomViewTopPoint = path2.currentPoint.y
        print(path2.currentPoint)
        UIColor.setFill(.white)()
        path2.fill()

        self.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: self.topAnchor,constant: bottomViewTopPoint).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        
    }

}
