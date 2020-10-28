//
//  MediTimeView.swift
//  CollectionView
//
//  Created by 맥북프로에임메드 on 2020/10/27.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class MediTimeView: UIView {
    let timeImageView = UIImageView()
    let timeLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        self.addSubview(timeImageView)
        timeImageView.translatesAutoresizingMaskIntoConstraints = false
        timeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        timeImageView.widthAnchor.constraint(equalToConstant: Util.ratio(34.5)).isActive = true
        timeImageView.heightAnchor.constraint(equalToConstant: Util.ratio(27.6)).isActive = true

        self.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: timeImageView.bottomAnchor,constant: Util.ratio(6.1)).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        timeLabel.textAlignment = .center
        timeLabel.textColor = Util.sapphireBlue
    }
    
    func settingUI(time:Time) {
        switch time {
        case .morning:
            timeImageView.image = UIImage(named: "medi_morning")
            timeLabel.text = "아침"
        case .lunch:
            timeImageView.image = UIImage(named: "medi_lunch")
            timeLabel.text = "점심"
        case .dinner:
            timeImageView.image = UIImage(named: "medi_dinner")
            timeLabel.text = "저녁"
        }
    }
    
    
    enum Time {
        case morning
        case lunch
        case dinner
    }

}
