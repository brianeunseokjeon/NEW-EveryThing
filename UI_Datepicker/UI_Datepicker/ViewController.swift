//
//  ViewController.swift
//  UI_Datepicker
//
//  Created by brian on 2020/10/28.
//

import UIKit

class ViewController: UIViewController {
    let datePickerView = MyDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(datePickerView)
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        datePickerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        datePickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        datePickerView.isHidden = true
        
    }
    
    @IBAction func act(_ sender: Any) {
        datePickerView.isHidden = false
        
        
    }
    
}

