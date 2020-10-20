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
        
        layout.minimumLineSpacing = 0
        c.isPagingEnabled = true
//        c.isScrollEnabled = false
        c.setCollectionViewLayout(layout, animated: false)
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
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.backgroundColor = .blue
        case 1:
        cell.backgroundColor = .red
        case 2:
        cell.backgroundColor = .green
        case 3:
        cell.backgroundColor = .gray
        default:
            cell.backgroundColor = .orange
        }
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let row = scrollView.contentOffset.x / UIScreen.main.bounds.width
//
//      let cell =  collectionView.cellForItem(at: IndexPath(item: Int(row), section: 0)) as! UICollectionViewCell
//                switch row {
//                case 0:
//                    cell.backgroundColor = .blue
//                case 1:
//                cell.backgroundColor = .red
//                case 2:
//                cell.backgroundColor = .green
//                case 3:
//                cell.backgroundColor = .gray
//                default:
//                    cell.backgroundColor = .orange
//                }
//
//    }
}
