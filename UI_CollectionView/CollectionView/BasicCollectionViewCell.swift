//
//  BasicCollectionViewCell.swift
//  CollectionView
//
//  Created by 맥북프로에임메드 on 2020/10/20.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit


class BasicCollectionViewCell: UICollectionViewCell {
   private let containerView = UIView()
   private let dateLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        self.backgroundColor = .white
        self.contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Util.ratio(4.6)).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: Util.ratio(120.8)).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: Util.ratio(34.5)).isActive = true
        containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        containerView.layer.cornerRadius = Util.ratio(34.5)/2
        
        
        containerView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: Util.ratio(6.5)).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -Util.ratio(8.6)).isActive = true
        dateLabel.text = "2019.12.20"
        dateLabel.textAlignment = .center
        dateLabel.textColor = Util.opacity50SapphireBlue
        
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                containerView.backgroundColor = Util.iceBlueTwo
                dateLabel.textColor = Util.sapphireBlue
            } else {
                containerView.backgroundColor = .white
                dateLabel.textColor = Util.opacity50SapphireBlue
            }
        }
    }
    
    override func prepareForReuse() {
        backgroundColor = nil
    }

}
