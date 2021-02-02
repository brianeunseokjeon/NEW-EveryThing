//
//  ListTableViewCell.swift
//  CleanTodo
//
//  Created by brian은석 on 2021/01/19.
//

import UIKit
//protocol ToDoCheckProtocol:class {
//    func changeToCheck(_ check:Bool,index:Int)
//}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: UIImageView!
//
//    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    private var isChecked = false
//    weak var delegate: ToDoCheckProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func inputData(title:String,isChecked:Bool) {
        let checkBoxImage = isChecked ? UIImage(named: "check") :  UIImage(named:"nonCheck")
        self.isChecked = isChecked
        checkBox.image = checkBoxImage
        titleLabel.text = title
    }
//    @IBAction func checkButtonAction(_ sender: Any) {
//        isChecked = !isChecked
//        delegate?.changeToCheck(isChecked, index: self.tag)
//    }
    
}
