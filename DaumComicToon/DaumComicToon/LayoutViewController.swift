//
//  LayoutViewController.swift
//  DaumComicToon
//
//  Created by Brian on 29/04/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var layoutLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        
        
    }
    

    @IBAction func text(_ sender: UITextField) {
        layoutLabel.text = sender.text
    }
    

}
