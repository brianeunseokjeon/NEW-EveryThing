//
//  BasicCell.swift
//  CellstackView
//
//  Created by 맥북프로에임메드 on 21/07/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnAction(_ sender: Any) {
        stackView.isHidden.toggle()
        
    }
}
