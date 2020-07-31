//
//  ViewController.swift
//  AutoLayoutTableView
//
//  Created by Brian on 19/05/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class ExpandCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
}

struct ExpandDataModel {
    var description: String
    var isExpand: Bool
}


class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var dataModels = [ExpandDataModel].init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = [
            "Short Text", "long long long long long long long long long long long long long long long long long long long long long long long long long long long long ",
            "Short Text", "long long long long long long long long long long long long long long long long long long long long long long long long long long long long ",
            "Short Text", "long long long long long long long long long long long long long long long long long long long long long long long long long long long long ",
            "Short Text", "long long long long long long long long long long long long long long long long long long long long long long long long long long long long "]
        
        for (_, value) in textArray.enumerated() {
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        UIView.setAnimationsEnabled(false) //나중에 true로..
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
        
    }
    
}
//오토레이아웃이 변해야 할때 UI 문제가 생길때가 있음.. performance
//1. heightForRowAt -> 에서 정확한 높이를 지정
//2. tableview.reloadData() --> 어느정도 해결
//3. 어느정도 해결
//tableView.estimatedSectionHeaderHeight = 0
//tableView.estimatedSectionFooterHeight = 0
// 4. 애니메이션 효과 없애는 확실히 해결
//UIView.setAnimationsEnabled(false) //나중에 true로..
//tableView.reloadRows(at: [indexPath], with: .none)
//UIView.setAnimationsEnabled(true)
