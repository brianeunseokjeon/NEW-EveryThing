//
//  ListTableViewCell.swift
//  CleanSwift_GetData
//
//  Created by brian은석 on 2021/02/02.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func inputData(name:String,age:Int) {
        nameLabel.text = name
        ageLabel.text = "\(age)"
    }

}
