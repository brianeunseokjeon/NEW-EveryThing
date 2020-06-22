//
//  MainModel.swift
//  LeakCheck
//
//  Created by 맥북프로에임메드 on 13/05/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import Foundation

class MainModel {
    var items = [1,2,3,4,5,6,7,8,9,10]
    
    func end(completion:@escaping () -> ()) {
        items.shuffle()
        print(items)
        completion()
    }
}
