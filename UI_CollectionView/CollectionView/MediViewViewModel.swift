//
//  MediViewViewModel.swift
//  CollectionView
//
//  Created by brian on 2020/10/26.
//  Copyright © 2020 brian. All rights reserved.
//

import Foundation

enum DiseaseType {
    case HighBloodPressure
    case Diabetes
    case Hyperlipidemia
}
struct MedicineTimeType {
    let disease: DiseaseType
    var isBreakfast: Bool
    var isLunch: Bool
    var isDinner: Bool
}

class MediViewViewModel {

    var mediTimeArray: [MedicineTimeType] = [
        MedicineTimeType(disease: .HighBloodPressure, isBreakfast: true, isLunch: false, isDinner: true),
        MedicineTimeType(disease: .Diabetes, isBreakfast: false, isLunch: false, isDinner: true),
//        MedicineTimeType(disease: .Hyperlipidemia, isBreakfast: true, isLunch: false, isDinner: true)
    ]
    
    
}
