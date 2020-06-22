//
//  Model.swift
//  MVVMstart
//
//  Created by 맥북프로에임메드 on 09/06/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import Foundation

class Person: NSObject {
    var name: String = ""
    var age: Int = 0
    var weight: Double = 0
    var height: Double = 0
    init(name: String, age: Int, weight: Double, height: Double) {
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height
    }
    
}


class Model: NSObject {
    func getPeopleData() -> NSDictionary {
        return [
            "People": [
                ["name":"James", "age":28, "weight":80,"height":167.5],
                ["name":"Lily", "age":32, "weight":60,"height":180.2],
                ["name":"Peter", "age":24, "weight":70,"height":175.4],
                ["name":"Jhon", "age":43, "weight":90,"height":156.9],
            ]
            
        ]
    }
}
