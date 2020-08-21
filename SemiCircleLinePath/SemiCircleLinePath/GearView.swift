//
//  GearView.swift
//  SemiCircleLinePath
//
//  Created by brian on 21/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class GearView: UIView {
    let lineWidth: CGFloat = 16
    let boxWidth: CGFloat = 5
    let toothAngle: CGFloat = 5
    let boxHeight: CGFloat = 15
    

    override func draw(_ rect: CGRect) {
        print("draw")
        print(self.frame)
        let radius = (min(bounds.width,bounds.height) - lineWidth ) / 6.0
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        UIColor.white.set()
        print(center.x,center.y)
        path.move(to: CGPoint(x: center.x + radius, y: center.y))
        path.addArc(withCenter: CGPoint(x: center.x + radius, y: center.y), radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.stroke()

        let line = UIBezierPath()
        let point = CGPoint(x: 150 - (boxWidth / 2.0), y: 100 - radius)
        line.move(to: point)
        line.addLine(to: CGPoint(x: point.x, y: point.y - boxHeight))
        line.addLine(to: CGPoint(x: point.x + boxWidth, y: point.y - boxHeight))

        line.addLine(to: CGPoint(x: point.x + boxWidth, y: point.y))
        line.close()
        UIColor.red.set()
//        line.fill()
        for _ in stride(from: CGFloat(0), through: 180, by: toothAngle) {
            line.apply(CGAffineTransform(translationX: -200, y: -200))
            line.apply(CGAffineTransform(rotationAngle: toothAngle * .pi / 180))
            line.apply(CGAffineTransform(translationX: 200, y: 200))
            line.fill()

        }
        
//                let path = UIBezierPath()
//                path.lineWidth = 10
//                let innerRadius: CGFloat = 50
//                let outerRadius: CGFloat = 60
//                let numTicks = 24
////        path.addLine(to: CGPoint(x: 10, y: 10))
//                for i in 0..<numTicks {
//                    let angle = CGFloat(i) * .pi*2 / CGFloat(numTicks)
//                    let inner = CGPoint(x: innerRadius * cos(angle), y: innerRadius * sin(angle))
//                    let outer = CGPoint(x: outerRadius * cos(angle), y: outerRadius * sin(angle))
//                    path.move(to: inner)
//                    path.addLine(to: outer)
//                    UIColor.red.set()
//                    print(path)
//
//                }
    }

}
