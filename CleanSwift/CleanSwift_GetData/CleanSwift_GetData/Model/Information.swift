//
//  GetData.swift
//  CleanSwift_GetData
//
//  Created by brian은석 on 2021/02/02.
//

import Foundation

struct Information:Codable {
    let feeds:[Detail]
    
    struct Detail :Codable{
        let id: Int
        let name: String
        let age: Int
    }
}
