//
//  MvvmModel.swift
//  MVVMstart
//
//  Created by 맥북프로에임메드 on 09/06/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import UIKit


class MvvmViewModel: NSObject {
    let model: Model = Model()
    var peopleData: NSArray = []
    
    override init() {

        let data1 = model.getPeopleData()["People"] as! NSArray
        let data2 = NSMutableArray()
        for i in 0..<data1.count {
            let tmpData = data1[i] as! NSDictionary
            let name = tmpData["name"] as! String
            let age = tmpData["age"] as! Int
            let weight = tmpData["weight"] as! Double
            let height = tmpData["height"] as! Double
            data2.add(Person(name: name, age: age, weight: weight, height: height))
        }
        
        peopleData = NSArray(array: data2)

    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MvvmTableViewCell", for: indexPath) as! MvvmTableViewCell
        cell.setup(person: peopleData[indexPath.row] as! Person)
        return cell
    }
}
