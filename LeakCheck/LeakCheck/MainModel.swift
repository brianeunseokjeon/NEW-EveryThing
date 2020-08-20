//
//  MainModel.swift
//  LeakCheck
//
//  Created by Brian on 13/05/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import Foundation

class MainModel {
    var items = [1,2,3,4,5,6,7,8,9,10]
    var de:ViewController?
    func end(completion:@escaping () -> ()) {
        items.shuffle()
        print(items)
        completion()
    }
    
    deinit {
        print("deinit mainModel")
    }
}
