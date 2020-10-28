//
//  LikeCollectionViewViewController.swift
//  CollectionView
//
//  Created by 맥북프로에임메드 on 2020/10/26.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class LikeCollectionViewViewController: UIViewController {
    let mediView = MediView()
    let morningView = MediTimeView()
    let lunchView = MediTimeView()
    let dinnerView = MediTimeView()
    
    let verticalTimeFirstView = UIView()
    let verticalTimeSecondView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timeViews = [morningView,lunchView,dinnerView]
        timeViews.forEach{
            $0.widthAnchor.constraint(equalToConstant: Util.ratio(115.3)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: Util.ratio(50)).isActive = true
            $0.backgroundColor = .white
        }
        verticalTimeFirstView.backgroundColor = Util.whiteFour
        verticalTimeFirstView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        verticalTimeFirstView.heightAnchor.constraint(equalToConstant: Util.ratio(50)).isActive = true
        
        verticalTimeSecondView.backgroundColor = Util.whiteFour
        verticalTimeSecondView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        verticalTimeSecondView.heightAnchor.constraint(equalToConstant: Util.ratio(50)).isActive = true
        
        morningView.settingUI(time: .morning)
        lunchView.settingUI(time: .lunch)
        dinnerView.settingUI(time: .dinner)

        let timeStackView = UIStackView(arrangedSubviews: [morningView,verticalTimeFirstView,lunchView,verticalTimeSecondView,dinnerView])

        view.addSubview(timeStackView)
        timeStackView.translatesAutoresizingMaskIntoConstraints = false
        timeStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        timeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.backgroundColor = .white
        view.addSubview(mediView)
        mediView.translatesAutoresizingMaskIntoConstraints = false
        mediView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mediView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mediView.layer.masksToBounds = true
        mediView.layer.borderColor = Util.warmGreyTwo.cgColor
        mediView.layer.borderWidth = 2
        mediView.layer.cornerRadius = 20
    }
    


}
