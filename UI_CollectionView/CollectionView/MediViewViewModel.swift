//
//  MediViewViewModel.swift
//  CollectionView
//
//  Created by brian on 2020/10/26.
//  Copyright © 2020 brian. All rights reserved.
//

import Foundation

enum DiseaseType {
    case none // 플러스 버튼 bool값으로.. 현재 -> 플러스버튼 / 과거 -> 표시안함
    case HighBloodPressure
    case Diabetes
    case Hyperlipidemia
}
struct MedicineTimeType {
    var disease: DiseaseType = .none
    var isMedicine: Bool = false // 아침 점심 저녁 이라는 값에 bool값으로 들어옴
    var isEat: Bool = false
    var isCurrentMedication: Bool = false // 무조건 하나는 있음. 나머지는 다 과거.
}

class MediViewViewModel {

    var mediTimeArray: [MedicineTimeType] = [
        MedicineTimeType(),//1
        MedicineTimeType(disease:.Diabetes,isMedicine: true),
        MedicineTimeType(),
        
        MedicineTimeType(),//4
        MedicineTimeType(disease:.HighBloodPressure,isMedicine: true),
        MedicineTimeType(disease:.HighBloodPressure,isMedicine: true),

        MedicineTimeType(),//7
        MedicineTimeType(),
        MedicineTimeType()//9
    ]
    
    
}
