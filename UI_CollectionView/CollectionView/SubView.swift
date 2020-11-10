//
//  SubView.swift
//  CollectionView
//
//  Created by 맥북프로에임메드 on 2020/11/04.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class SubView: UIView {
    let diseaseTextLabel = UILabel()
    
    let breakfastContainView = UIView()
    let breakfastImageView = UIImageView()
    let breakfastLabel = UILabel()
    
    let lunchContainView = UIView()
    let lunchImageView = UIImageView()
    let lunchLabel = UILabel()
    
    let dinnerContainView = UIView()
    let dinnerImageView = UIImageView()
    let dinnerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    func makeUI() {
        let totalTimeStackView = UIStackView(arrangedSubviews: [breakfastContainView,lunchContainView,dinnerContainView])
        
        let totalStackView = UIStackView(arrangedSubviews: [diseaseTextLabel,totalTimeStackView])
        totalStackView.axis = .vertical
        totalStackView.spacing = Util.ratio(17.6)
        totalStackView.alignment = .fill
        totalTimeStackView.distribution = .fill
        
        
        self.addSubview(totalStackView)
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        totalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        totalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        totalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        totalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
        
        breakfastLabel.text = "아침"
        breakfastImageView.image = UIImage(named: "medi_morning")
        
        let smallBreakfastStackView = UIStackView(arrangedSubviews: [breakfastImageView,breakfastLabel])
        smallBreakfastStackView.spacing = Util.ratio(13.8)
        smallBreakfastStackView.axis = .horizontal
        smallBreakfastStackView.distribution = .fill
        smallBreakfastStackView.alignment = .bottom
        
        breakfastImageView.widthAnchor.constraint(equalToConstant: Util.ratio(24.9)).isActive = true
        breakfastImageView.heightAnchor.constraint(equalToConstant: Util.ratio(19.9)).isActive = true
        
        
        breakfastContainView.addSubview(smallBreakfastStackView)
        smallBreakfastStackView.translatesAutoresizingMaskIntoConstraints = false
        smallBreakfastStackView.centerXAnchor.constraint(equalTo: breakfastContainView.centerXAnchor).isActive = true
        smallBreakfastStackView.topAnchor.constraint(equalTo: breakfastContainView.topAnchor,constant: Util.ratio(18)).isActive = true
        smallBreakfastStackView.widthAnchor.constraint(equalToConstant: Util.ratio(70)).isActive = true
        smallBreakfastStackView.heightAnchor.constraint(equalToConstant: Util.ratio((19.9))).isActive = true
        
        breakfastContainView.layer.cornerRadius = Util.ratio(51.8) / 2
        breakfastContainView.layer.borderWidth = 1
        breakfastContainView.heightAnchor.constraint(equalToConstant: Util.ratio(51.8)).isActive = true
        breakfastContainView.backgroundColor = .white
        
        lunchLabel.text = "점심"
        lunchImageView.image = UIImage(named: "medi_lunch")
        
        let smallLunchStackView = UIStackView(arrangedSubviews: [lunchImageView,lunchLabel])
        smallLunchStackView.spacing = Util.ratio(13.8)
        smallLunchStackView.axis = .horizontal
        smallLunchStackView.distribution = .fill
        smallLunchStackView.alignment = .fill
        
        lunchImageView.widthAnchor.constraint(equalToConstant: Util.ratio(24.9)).isActive = true
        lunchImageView.heightAnchor.constraint(equalToConstant: Util.ratio(19.9)).isActive = true
        
        lunchContainView.addSubview(smallLunchStackView)
        smallLunchStackView.translatesAutoresizingMaskIntoConstraints = false
        
        smallLunchStackView.centerXAnchor.constraint(equalTo: lunchContainView.centerXAnchor).isActive = true
        smallLunchStackView.centerYAnchor.constraint(equalTo: lunchContainView.centerYAnchor).isActive = true
        lunchContainView.layer.cornerRadius = Util.ratio(51.8) / 2
        lunchContainView.layer.borderWidth = 1
        lunchContainView.heightAnchor.constraint(equalToConstant: Util.ratio(51.8)).isActive = true
        lunchContainView.backgroundColor = .white
        
        dinnerLabel.text = "저녁"
        dinnerImageView.image = UIImage(named: "icon_dinner")
        
        let smallDinnerStackView = UIStackView(arrangedSubviews: [dinnerImageView,dinnerLabel])
        smallDinnerStackView.spacing = Util.ratio(13.8)
        smallDinnerStackView.axis = .horizontal
        smallDinnerStackView.distribution = .fill
        smallDinnerStackView.alignment = .fill
        
        dinnerImageView.widthAnchor.constraint(equalToConstant: Util.ratio(24.9)).isActive = true
        dinnerImageView.heightAnchor.constraint(equalToConstant: Util.ratio(19.9)).isActive = true
        
        dinnerContainView.addSubview(smallDinnerStackView)
        smallDinnerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        smallDinnerStackView.centerXAnchor.constraint(equalTo: dinnerContainView.centerXAnchor).isActive = true
        smallDinnerStackView.centerYAnchor.constraint(equalTo: dinnerContainView.centerYAnchor).isActive = true
        dinnerContainView.layer.cornerRadius = Util.ratio(51.8) / 2
        dinnerContainView.layer.borderWidth = 1
        dinnerContainView.heightAnchor.constraint(equalToConstant: Util.ratio(51.8)).isActive = true
        dinnerContainView.backgroundColor = .white
        
        diseaseTextLabel.text = "고혈압"
        diseaseTextLabel.textAlignment = .center
        
        totalTimeStackView.axis = .vertical
        totalTimeStackView.spacing = Util.ratio(6.9)
        totalTimeStackView.alignment = .fill
        totalTimeStackView.distribution = .equalSpacing
        
        
        diseaseTextLabel.heightAnchor.constraint(equalToConstant: Util.ratio(31)).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
    
}
