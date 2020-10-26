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

    override func viewDidLoad() {
        super.viewDidLoad()
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
