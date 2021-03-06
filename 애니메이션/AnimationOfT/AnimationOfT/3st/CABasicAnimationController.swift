//
//  CABasicAnimation.swift
//  AnimationOfT
//
//  Created by 맥북프로에임메드 on 2021/05/24.
//


import UIKit

class CABasicAnimationController: UIViewController {
    fileprivate let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    fileprivate var imageView:UIImageView = UIImageView(image: UIImage(named: "dog"))
    fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.blurView.alpha = 0.5

        imageView.layer.masksToBounds = true
        blurView.layer.masksToBounds = true

        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }

        setupCABasic()
        setupSlider()
    }
    fileprivate func setupCABasic() {
        
        let basic0 = CABasicAnimation(keyPath: "transform.scale")
        basic0.toValue = 0.5
        basic0.duration = 2

        basic0.fillMode = CAMediaTimingFillMode.forwards
        basic0.isRemovedOnCompletion = false

        imageView.layer.add(basic0, forKey: "maxcodes.io")
        blurView.layer.add(basic0, forKey: "maxcodes.io")

        let basic1 = CABasicAnimation(keyPath: "cornerRadius")
        basic1.toValue = 50
        basic1.duration = 2

        basic1.fillMode = CAMediaTimingFillMode.forwards
        basic1.isRemovedOnCompletion = false

        imageView.layer.add(basic1, forKey: "maxcodes.io/courses")
        blurView.layer.add(basic1, forKey: "maxcodes.io/courses")

        let basic2 = CABasicAnimation(keyPath: "opacity")
        basic2.toValue = 0
        basic2.duration = 2

        basic2.fillMode = CAMediaTimingFillMode.forwards
        basic2.isRemovedOnCompletion = false
        blurView.layer.add(basic2, forKey: "maxcodes.io/books")
    }

    fileprivate func setupSlider() {
           let slider = UISlider()
           slider.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(slider)
           
           slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
           slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
           
           slider.addTarget(self, action: #selector(handleSliderChanged(slide:)), for: .allEvents)
       }
       
       @objc fileprivate func handleSliderChanged(slide: UISlider) {
           print(slide.value)
           animator.fractionComplete = CGFloat(slide.value)
       }
   }
