//
//  BasicCell.swift
//  CellstackView
//
//  Created by Brian on 21/07/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    @IBOutlet weak var celllayout: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.isHidden = true
        celllayout.priority = .init(rawValue: 10)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnAction(_ sender: Any) {
        stackView.isHidden.toggle()
        if stackView.isHidden {
            celllayout.priority = .init(rawValue: 10)

        } else {
            celllayout.priority = .init(rawValue: 1000)

        }
        
    }
}
