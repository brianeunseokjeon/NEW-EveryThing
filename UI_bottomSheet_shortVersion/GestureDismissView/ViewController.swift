//
//  ViewController.swift
//  GestureDismissView
//
//  Created by 맥북프로에임메드 on 2021/06/17.
//

import UIKit

enum CardViewState {
    case top
    case bottom
}

class ViewController: UIViewController {
   
    var bottomCardViewInitPoint: CGPoint!
    var bottomCardView: UIView!
    var bottomState = CardViewState.top
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        gestureInit()
    }
    
    private func makeUI() {
        bottomCardView = UIView(frame: CGRect(x: 0, y: view.frame.height*0.4, width: view.frame.width, height: view.frame.height*0.6))
        view.addSubview(bottomCardView)
        bottomCardView.backgroundColor = .yellow
        bottomCardView.roundCorners([.topLeft, .topRight], radius: 26)
    }
    
    private func gestureInit() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        bottomCardView.addGestureRecognizer(panGesture)
        bottomCardViewInitPoint = CGPoint(x: 0, y: view.frame.height*0.4)

    }
    
    
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: bottomCardView)

        guard bottomState == .top && translation.y > 0 || bottomState == .bottom && translation.y < 0 else { return }
        bottomCardView.frame.origin = CGPoint(x: 0, y: bottomCardViewInitPoint!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 0 {
                bottomCardViewInitPoint = CGPoint(x: 0, y: view.frame.height - view.safeAreaInsets.bottom - 60 )
                bottomState = .bottom

            } else {
                bottomCardViewInitPoint = CGPoint(x: 0, y: view.frame.height*0.4)
                bottomState = .top
            }
            UIView.animate(withDuration: 0.22) { [weak self] in
                guard let self = self else {return}
                self.bottomCardView.frame.origin = self.bottomCardViewInitPoint
            }
        }
    }


}

extension UIView {
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
      let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                              cornerRadii: CGSize(width: radius, height: radius))
      let mask = CAShapeLayer()
      mask.path = path.cgPath
      layer.mask = mask
  }
}
