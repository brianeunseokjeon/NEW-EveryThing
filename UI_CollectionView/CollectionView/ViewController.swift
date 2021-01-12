//
//  ViewController.swift
//  CollectionView
//
//  Created by 맥북프로에임메드 on 2020/10/20.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let collectionView: UICollectionView = {
       
    let layout = UICollectionViewFlowLayout()
        let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        c.bounces = false
        return c
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: Util.ratio(49.8)).isActive = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BasicCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(MediMoreCollectionViewCell.self, forCellWithReuseIdentifier: "lastCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lastCell", for: indexPath) as! MediMoreCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BasicCollectionViewCell
            return cell
        }
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 4 {
            return CGSize(width: Util.ratio(64.9), height: Util.ratio(49.8))
        } else {
            return CGSize(width: Util.ratio(120.8), height: Util.ratio(49.8))
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: Util.ratio(21.8), bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 4{
            
        } else {
            
        }
    }
    
}
