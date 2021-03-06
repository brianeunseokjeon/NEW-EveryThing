//
//  MediObjectButton.swift
//  CollectionView
//
//  Created by brian on 2020/10/26.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class MediObjectButton: UIButton {
    let plusImageView = UIImageView()
    let medicineImageView = UIImageView()
    let checkMarkImageView = UIImageView()
    let medicineLabel = UILabel()
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
        
    }
    func makeUI() {
        self.addSubview(plusImageView)
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        plusImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        plusImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        plusImageView.widthAnchor.constraint(equalToConstant: Util.ratio(43.7)).isActive = true
        plusImageView.heightAnchor.constraint(equalToConstant: Util.ratio(43.7)).isActive = true
        plusImageView.image = UIImage(named: "medi add")
        
//        plusImageView.isHidden = true
        
        
        self.addSubview(medicineImageView)
        medicineImageView.translatesAutoresizingMaskIntoConstraints = false
        medicineImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Util.ratio(13.8)).isActive = true
        medicineImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        medicineImageView.widthAnchor.constraint(equalToConstant: Util.ratio(56.7)).isActive = true
        medicineImageView.heightAnchor.constraint(equalToConstant: Util.ratio(52.9)).isActive = true
        medicineImageView.image = UIImage(named: "medicine_01")
        medicineImageView.isHidden = true
        
        self.addSubview(medicineLabel)
        medicineLabel.translatesAutoresizingMaskIntoConstraints = false
        medicineLabel.topAnchor.constraint(equalTo: medicineImageView.bottomAnchor).isActive = true
        medicineLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        medicineLabel.heightAnchor.constraint(equalToConstant: Util.ratio(14.7)).isActive = true
        medicineLabel.text = "고지혈증"
        medicineLabel.textColor = .black
        medicineLabel.isHidden = true

        
        self.addSubview(checkMarkImageView)
        checkMarkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkMarkImageView.bottomAnchor.constraint(equalTo: medicineLabel.topAnchor,constant: -Util.ratio(12.6)).isActive = true
        checkMarkImageView.leadingAnchor.constraint(equalTo: medicineImageView.leadingAnchor,constant: Util.ratio(32.6)).isActive = true
        checkMarkImageView.widthAnchor.constraint(equalToConstant: Util.ratio(23)).isActive = true
        checkMarkImageView.heightAnchor.constraint(equalToConstant: Util.ratio(23)).isActive = true
        checkMarkImageView.image = UIImage(named: "medi_success")
        checkMarkImageView.isHidden = true
        
    }

    func settingMedicine(disease:DiseaseType,exist:Bool,isEat:Bool,isCurrent:Bool) {
        if isCurrent {
            plusImageView.isHidden = false

        } else {
            plusImageView.isHidden = true

        }

        switch disease {
        case .Diabetes:
            if isCurrent {
                medicineImageView.image = UIImage(named: "medicine_03")
                medicineLabel.textColor = Util.blackTwo
                plusImageView.isHidden = exist

            } else {
                medicineImageView.image = UIImage(named: "medicine_003")
                medicineLabel.textColor = Util.brownishGrey
            }
            medicineLabel.text = "당뇨"

        case .HighBloodPressure:
            if isCurrent {
                medicineImageView.image = UIImage(named: "medicine_02")
                medicineLabel.textColor = Util.blackTwo
                plusImageView.isHidden = exist

            } else {
                medicineImageView.image = UIImage(named: "medicine_002")
                medicineLabel.textColor = Util.brownishGrey

            }
            medicineLabel.text = "고혈압"

        case .Hyperlipidemia:
            if isCurrent {
                medicineImageView.image = UIImage(named: "medicine_01")
                medicineLabel.textColor = Util.blackTwo
                plusImageView.isHidden = exist

            } else {
                medicineImageView.image = UIImage(named: "medicine_001")
                medicineLabel.textColor = Util.brownishGrey

            }
            medicineLabel.text = "고지혈증"

        case .none:
            break
        }
        
        medicineImageView.isHidden = !exist
        medicineLabel.isHidden = !exist
        checkMarkImageView.isHidden = !isEat
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
