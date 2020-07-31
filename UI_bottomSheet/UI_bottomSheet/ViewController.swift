//
//  ViewController.swift
//  UI_bottomSheet
//
//  Created by brian on 28/07/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bottomSheetVC = BottomSheetViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    private func navigationItem() {
//        self.navigationController?.navigationBar.topItem?.title = "뒤로"
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.addChild(bottomSheetVC)
        self.view.addSubview(bottomSheetVC.view)
        bottomSheetVC.didMove(toParent: self)

        let height = view.frame.height
        let width  = view.frame.width
        bottomSheetVC.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
    }
    

    


 
    @IBAction func action(_ sender: Any) {

//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(.success)
        let generator2 = UIImpactFeedbackGenerator(style: .light)
        generator2.impactOccurred()
//        let generator3 = UISelectionFeedbackGenerator()
//        generator3.selectionChanged()
        bottomSheetVC.appearBottomSheet()
    }

}

