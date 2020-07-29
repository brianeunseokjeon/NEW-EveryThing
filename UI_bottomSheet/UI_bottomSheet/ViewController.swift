//
//  ViewController.swift
//  UI_bottomSheet
//
//  Created by 맥북프로에임메드 on 28/07/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let bottomSheet = BottomSheet()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem()
        prepareBackgroundView()
        makeUI()
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture))
        bottomSheet.addGestureRecognizer(gesture)
    }
    
    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let y = self.view.frame.minY
        self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
        recognizer.setTranslation(.zero, in: self.view)
    }
    
    
    private func navigationItem() {
        self.navigationController?.navigationBar.topItem?.title = "뒤로"
    }
    
    
    func prepareBackgroundView(){
        let blurEffect = UIBlurEffect.init(style: .dark)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)

        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds

        view.insertSubview(bluredView, at: 0)
    }
    private func makeUI() {
//        view.addSubview(scrollView)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//        scrollView.addSubview(bottomSheet)
//        bottomSheet.translatesAutoresizingMaskIntoConstraints = false
////        bottomSheet.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        bottomSheet.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//        bottomSheet.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
//        bottomSheet.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        bottomSheet.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        bottomSheet.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        view.addSubview(bottomSheet)
        let height = view.frame.height
        let width  = view.frame.width
        bottomSheet.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
        
        
    }
    @IBAction func action(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            let frame = self?.view.frame
            let yComponent = UIScreen.main.bounds.height - 300
            self?.bottomSheet.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
        })
        
    }

}

