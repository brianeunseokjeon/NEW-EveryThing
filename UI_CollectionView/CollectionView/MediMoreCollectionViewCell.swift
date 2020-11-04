//
//  MediMoreCollectionViewCell.swift
//  CollectionView
//
//  Created by 맥북프로에임메드 on 2020/11/04.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class MediMoreCollectionViewCell: UICollectionViewCell {
     private let moreButton = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        self.contentView.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Util.ratio(13)).isActive = true
//        moreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Util.ratio(28.1)).isActive = true
//        moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Util.ratio(19.6)).isActive = true
        moreButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,constant: Util.ratio(4.4)).isActive = true
        moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -Util.ratio(19.5)).isActive = true
//        moreButton.setImage(UIImage(named: "icon_more"), for: .normal)
        moreButton.image = UIImage(named: "icon_more")
        moreButton.widthAnchor.constraint(equalTo: moreButton.heightAnchor).isActive = true
    }
}
