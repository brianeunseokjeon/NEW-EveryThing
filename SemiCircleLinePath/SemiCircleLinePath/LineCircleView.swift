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
    let numberOfPercentLabel = UILabel()
    let percentLabel = UILabel()
    let innerTitleLabel = UILabel()
    let titleGap: CGFloat = 5
    let textColor = #colorLiteral(red: 0.1035098806, green: 0.2976028919, blue: 0.64378196, alpha: 1)
    lazy var pathPoint: (CGFloat,CGFloat) = {
        return (self.bounds.maxX/2,self.bounds.maxY - 40)
    }()
    lazy var radius: CGFloat = {
        return self.frame.width/2
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
        print("View init")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func makeUI() {
        self.addSubview(numberOfPercentLabel)
        numberOfPercentLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfPercentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 5).isActive = true
//        numberOfPercentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -UIScreen.main.bounds.width/5).isActive = true
        numberOfPercentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: -10).isActive = true
        numberOfPercentLabel.text = "68"
        numberOfPercentLabel.font = UIFont.boldSystemFont(ofSize: 50)
        numberOfPercentLabel.textColor = textColor
        
        self.addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.bottomAnchor.constraint(equalTo: numberOfPercentLabel.bottomAnchor).isActive = true
        percentLabel.leadingAnchor.constraint(equalTo: numberOfPercentLabel.trailingAnchor).isActive = true
        percentLabel.text = "%"
        percentLabel.font = UIFont.systemFont(ofSize: 35)
        percentLabel.textColor = textColor

        
        self.addSubview(innerTitleLabel)
        innerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        innerTitleLabel.topAnchor.constraint(equalTo: numberOfPercentLabel.bottomAnchor,constant: titleGap).isActive = true
        innerTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        innerTitleLabel.text = "활동량 달성률"
        innerTitleLabel.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        innerTitleLabel.textColor = textColor


    }
    
    
    override func draw(_ rect: CGRect) {
        print("draw")
        let containPath = UIBezierPath(arcCenter: CGPoint(x: pathPoint.0, y: pathPoint.1), radius: radius - lineWidth, startAngle: .pi*(9/12), endAngle: .pi*(27/12), clockwise: true)
        containPath.lineWidth = lineWidth
        let containColor = #colorLiteral(red: 0.9753335118, green: 0.9695350528, blue: 0.9797903895, alpha: 0.11)
        UIColor.setStroke(containColor)()
        containPath.stroke()
        
        //
        let innerSemiCircle = UIBezierPath(arcCenter: CGPoint(x: pathPoint.0, y: pathPoint.1), radius: radius - lineWidth*(3/2), startAngle: .pi*(9/12), endAngle: .pi*(27/12), clockwise: true)
        innerSemiCircle.close()
        UIColor.setFill(.white)()
        innerSemiCircle.fill()

        let innerPath = UIBezierPath(arcCenter: CGPoint(x: pathPoint.0, y: pathPoint.1), radius: radius - lineWidth*(3/2) - 16, startAngle: .pi*(9/12), endAngle: .pi*(27/12), clockwise: true)
        let pattern: [CGFloat] = [2,8]
        innerPath.lineWidth = 8
        let lineColor = #colorLiteral(red: 0.873897016, green: 0.8687025905, blue: 0.8778902888, alpha: 0.4096479024)
        UIColor.setStroke(lineColor)()
        innerPath.setLineDash(pattern, count: 2, phase: 0)
        innerPath.stroke()
        
    }
    
    func addLayer(startAng:CGFloat,endAng:CGFloat) {
        let path = UIBezierPath(arcCenter: CGPoint(x: pathPoint.0, y: pathPoint.1), radius: self.frame.width/2 - lineWidth, startAngle: startAng, endAngle: endAng, clockwise: true)
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        
        let firstColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0.1282106166).cgColor
        let mainColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        gradient.colors = [mainColor,firstColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        let shapeMask = CAShapeLayer()
        shapeMask.path = path.cgPath
        shapeMask.lineWidth = lineWidth
        shapeMask.lineDashPhase = 0
        shapeMask.lineDashPattern = [ 3, 9 ]
        //        shapeMask.lineCap = .butt
        //        shapeMask.lineJoin = .bevel
        shapeMask.strokeColor = UIColor.white.cgColor   //  Any color
        shapeMask.fillColor = nil
        gradient.mask = shapeMask
        layer.addSublayer(gradient)
    }

}
//let path = UIBezierPath(arcCenter: CGPoint(x: pathPoint.0, y: pathPoint.1), radius: self.frame.width/2 - lineWidth, startAngle: .pi, endAngle: .pi*(3/2), clockwise: true)
// let gradient = CAGradientLayer()
// gradient.frame = bounds
//
// let firstColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0.1282106166).cgColor
// let mainColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
// gradient.colors = [mainColor,firstColor]
// gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
// gradient.endPoint = CGPoint(x: 0, y: 1)
//
// let shapeMask = CAShapeLayer()
// shapeMask.path = path.cgPath
// shapeMask.lineWidth = lineWidth
// shapeMask.lineDashPhase = 0
// shapeMask.lineDashPattern = [ 3, 9 ]
// //        shapeMask.lineCap = .butt
// //        shapeMask.lineJoin = .bevel
// shapeMask.strokeColor = UIColor.white.cgColor   //  Any color
// shapeMask.fillColor = nil
// gradient.mask = shapeMask
// layer.addSublayer(gradient)
