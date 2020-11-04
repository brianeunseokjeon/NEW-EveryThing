//
//  LikeCollectionViewViewController.swift
//  CollectionView
//
//  Created by 맥북프로에임메드 on 2020/10/26.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class LikeCollectionViewViewController: UIViewController {
    //1탄
    let mediView = MediView()
    let morningView = MediTimeView()
    let lunchView = MediTimeView()
    let dinnerView = MediTimeView()
    let verticalTimeFirstView = UIView()
    let verticalTimeSecondView = UIView()

    
    //2탄
    let breakfastFirstView = MediObjectButton()
    let breakfastSecondView = MediObjectButton()
    let breakfastThirdView = MediObjectButton()
    
    let lunchFirstView = MediObjectButton()
    let lunchSecondView = MediObjectButton()
    let lunchThirdView = MediObjectButton()

    let dinnerFirstView = MediObjectButton()
    let dinnerSecondView = MediObjectButton()
    let dinnerThirdView = MediObjectButton()
    
    let firstOneVerticalView = UIView()
    let firstTwoVerticalView = UIView()
    let secondOneVerticalView = UIView()
    let secondTwoVerticalView = UIView()
    let thirdOneVerticalView = UIView()
    let thirdTwoVerticalVeiw = UIView()
    
    var firstStackView: UIStackView!
    var secondStackView: UIStackView!
    var thirdStackView: UIStackView!
    var totalStackView: UIStackView!
    
    lazy var containViews = [breakfastFirstView,lunchFirstView,dinnerFirstView,
                             breakfastSecondView,lunchSecondView,dinnerSecondView,
                             breakfastThirdView,lunchThirdView,dinnerThirdView]
    
    lazy var verticalViews = [firstOneVerticalView,firstTwoVerticalView,
                              secondOneVerticalView,secondTwoVerticalView,
                              thirdOneVerticalView,thirdTwoVerticalVeiw]

    let viewModel = MediViewViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        makeUIFirst()
        makeUISecond()
        settingUI()
    }
    func makeUISecond() {
        view.backgroundColor = .white
        var countTag = 0
        containViews.forEach{
            $0.widthAnchor.constraint(equalToConstant: Util.ratio(116.5)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: Util.ratio(88.9)).isActive = true
            $0.backgroundColor = Util.iceBlueTwo
            $0.tag = countTag
            countTag += 1
        }
        verticalViews.forEach {
            $0.widthAnchor.constraint(equalToConstant: Util.ratio(1.2)).isActive = true
            $0.heightAnchor.constraint(equalToConstant: Util.ratio(88.9)).isActive = true
            $0.backgroundColor = Util.lightBlueGrey
        }
        firstStackView = UIStackView(arrangedSubviews: [breakfastFirstView,firstOneVerticalView,lunchFirstView,firstTwoVerticalView,dinnerFirstView])
        secondStackView = UIStackView(arrangedSubviews: [breakfastSecondView,secondOneVerticalView,lunchSecondView,secondTwoVerticalView,dinnerSecondView])
        thirdStackView = UIStackView(arrangedSubviews: [
            breakfastThirdView,thirdOneVerticalView,lunchThirdView,thirdTwoVerticalVeiw,dinnerThirdView
        ])
        firstStackView.axis = .horizontal
        firstStackView.alignment = .fill
        firstStackView.distribution = .fill
        
        secondStackView.axis = .horizontal
        secondStackView.alignment = .fill
        secondStackView.distribution = .fill

        thirdStackView.axis = .horizontal
        thirdStackView.alignment = .fill
        thirdStackView.distribution = .fill

        let breakfastLabel = UILabel()
        breakfastLabel.text = "아침"
        breakfastLabel.textColor = .black
        breakfastLabel.textAlignment = .center
        breakfastLabel.widthAnchor.constraint(equalToConstant: Util.ratio(116.5)).isActive = true
        breakfastLabel.heightAnchor.constraint(equalToConstant: Util.ratio(19.6)).isActive = true
        breakfastLabel.backgroundColor = Util.iceBlueTwo
        let lunchLabel = UILabel()
        lunchLabel.text = "점심"
        lunchLabel.textColor = .black
        lunchLabel.textAlignment = .center

        lunchLabel.widthAnchor.constraint(equalToConstant: Util.ratio(116.5)).isActive = true
        lunchLabel.heightAnchor.constraint(equalToConstant: Util.ratio(19.6)).isActive = true
        lunchLabel.backgroundColor = Util.iceBlueTwo

        let dinnerLabel = UILabel()
        dinnerLabel.text = "저녁"
        dinnerLabel.textColor = .black
        dinnerLabel.textAlignment = .center

        dinnerLabel.widthAnchor.constraint(equalToConstant: Util.ratio(116.5)).isActive = true
        dinnerLabel.heightAnchor.constraint(equalToConstant: Util.ratio(19.6)).isActive = true
        dinnerLabel.backgroundColor = Util.iceBlueTwo

        let vertiShortFirstView = UIView()
        let vertiShortSecondView = UIView()
        
        vertiShortFirstView.widthAnchor.constraint(equalToConstant: Util.ratio(1.2)).isActive = true
        vertiShortFirstView.heightAnchor.constraint(equalToConstant: Util.ratio(10)).isActive = true
        vertiShortFirstView.backgroundColor = Util.lightBlueGrey
        vertiShortSecondView.widthAnchor.constraint(equalToConstant: Util.ratio(1.2)).isActive = true
        vertiShortSecondView.heightAnchor.constraint(equalToConstant: Util.ratio(10)).isActive = true
        vertiShortSecondView.backgroundColor = Util.lightBlueGrey


        let labelStackView = UIStackView(arrangedSubviews: [breakfastLabel,vertiShortFirstView,lunchLabel,vertiShortSecondView,dinnerLabel])
        labelStackView.axis = .horizontal
        labelStackView.alignment = .bottom
        labelStackView.distribution = .fill
        labelStackView.heightAnchor.constraint(equalToConstant: Util.ratio(19.6)).isActive = true

        
        
        totalStackView = UIStackView(arrangedSubviews: [labelStackView,firstStackView,secondStackView,thirdStackView])
        totalStackView.axis = .vertical
        totalStackView.alignment = .fill
        totalStackView.distribution = .fill

        view.addSubview(totalStackView)
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        totalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        totalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    func settingUI() {
        for x in 0...8 {
            containViews[x].settingMedicine(disease: viewModel.mediTimeArray[x].disease, exist: viewModel.mediTimeArray[x].isMedicine, isEat: viewModel.mediTimeArray[x].isEat, isCurrent: viewModel.mediTimeArray[x].isCurrentMedication)
        }
    }
    
    func makeUIFirst() {
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
