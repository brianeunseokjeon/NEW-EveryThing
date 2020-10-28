//
//  MediView.swift
//  CollectionView
//
//  Created by brian on 2020/10/26.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class MediView: UIView {
    let breakfastFirstView = MediObjectButton()
    let breakfastSecondView = MediObjectButton()
    let breakfastThirdView = MediObjectButton()
    
    let lunchFirstView = MediObjectButton()
    let lunchSecondView = MediObjectButton()
    let lunchThirdView = MediObjectButton()

    let dinnerFirstView = MediObjectButton()
    let dinnerSecondView = MediObjectButton()
    let dinnerThirdView = MediObjectButton()

    let verticalFirstLine = UIView()
    let verticalSecondLine = UIView()
    
    let firstHorizontalFirstLine = UIView()
    let firstHorizontalSecondLine = UIView()
    
    let secondHorizontalFirstLine = UIView()
    let secondHorizontalSecondLine = UIView()

    let thirdHorizontalFirstLine = UIView()
    let thirdHorizontalSecondLine = UIView()
    
    
    
    let viewModel = MediViewViewModel()

    lazy var containViews = [breakfastFirstView,lunchFirstView,dinnerFirstView,
                             breakfastSecondView,lunchSecondView,dinnerSecondView,
                             breakfastThirdView,lunchThirdView,dinnerThirdView]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
        settingUI()
    }
    
    func makeUI() {
        var countTag = 0
        containViews.forEach{
            $0.widthAnchor.constraint(equalToConstant: Util.ratio(115.3)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: Util.ratio(97)).isActive = true
            $0.backgroundColor = .white
            $0.addTarget(self, action: #selector(checkButton(sender:)), for: .touchUpInside)
            $0.tag = countTag
            countTag += 1
        }
        
        let horizontalViews = [firstHorizontalFirstLine,firstHorizontalSecondLine,secondHorizontalFirstLine,secondHorizontalSecondLine,thirdHorizontalFirstLine,thirdHorizontalSecondLine]
        horizontalViews.forEach{
            $0.widthAnchor.constraint(equalToConstant: Util.ratio(80.1)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
            $0.backgroundColor = Util.whiteThree
        }
        
        let verticalViews = [verticalFirstLine,verticalSecondLine]
        verticalViews.forEach{
            $0.widthAnchor.constraint(equalToConstant: 1).isActive = true
            $0.heightAnchor.constraint(equalToConstant: Util.ratio(270.6)).isActive = true
            $0.backgroundColor = Util.whiteThree
        }
        
        

        let breakfastStackView = UIStackView(arrangedSubviews: [breakfastFirstView,firstHorizontalFirstLine,breakfastSecondView,firstHorizontalSecondLine,breakfastThirdView])
        breakfastStackView.alignment = .center
        breakfastStackView.axis = .vertical
        breakfastStackView.spacing = 0

        let lunchStackView = UIStackView(arrangedSubviews: [lunchFirstView,secondHorizontalFirstLine,lunchSecondView,secondHorizontalSecondLine,lunchThirdView])
        lunchStackView.alignment = .center
        lunchStackView.axis = .vertical
        lunchStackView.spacing = 0

        let dinnerStackView = UIStackView(arrangedSubviews: [dinnerFirstView,thirdHorizontalFirstLine,dinnerSecondView,thirdHorizontalSecondLine,dinnerThirdView])
        dinnerStackView.alignment = .center
        dinnerStackView.axis = .vertical
        dinnerStackView.spacing = 0

        let totalStackView = UIStackView(arrangedSubviews: [breakfastStackView,verticalFirstLine,lunchStackView,verticalSecondLine,dinnerStackView])
        totalStackView.alignment = .center
        totalStackView.axis = .horizontal
        totalStackView.spacing = 0

        self.addSubview(totalStackView)
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        totalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        totalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        totalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        totalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
        

    }
    
    func settingUI() {
        for x in 0...8 {
            containViews[x].settingMedicine(disease: viewModel.mediTimeArray[x].disease, exist: viewModel.mediTimeArray[x].isMedicine, isEat: viewModel.mediTimeArray[x].isEat, isCurrent: viewModel.mediTimeArray[x].isCurrentMedication)
        }
    }
    
    //모델에 있어서 
    @objc func checkButton(sender:MediObjectButton) {
        if viewModel.mediTimeArray[sender.tag].isMedicine == true && viewModel.mediTimeArray[sender.tag].isCurrentMedication ==  true {
            viewModel.mediTimeArray[sender.tag].isEat = !viewModel.mediTimeArray[sender.tag].isEat
            
            containViews[sender.tag].settingMedicine(disease: viewModel.mediTimeArray[sender.tag].disease,
                                                     exist: viewModel.mediTimeArray[sender.tag].isMedicine,
                                                     isEat: viewModel.mediTimeArray[sender.tag].isEat,
                                                     isCurrent: viewModel.mediTimeArray[sender.tag].isCurrentMedication)
        }
        print(sender.tag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
