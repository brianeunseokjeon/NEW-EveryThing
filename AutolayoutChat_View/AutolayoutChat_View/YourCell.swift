//
//  YourCell.swift
//  AutolayoutChat_View
//
//  Created by 맥북프로에임메드 on 19/05/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import UIKit

class YourCell: UITableViewCell {

    @IBOutlet weak var yourTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
