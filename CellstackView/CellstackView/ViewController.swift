//
//  ViewController.swift
//  CellstackView
//
//  Created by 맥북프로에임메드 on 21/07/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BasicCell", bundle: nil), forCellReuseIdentifier: "BasicCell")
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension

    }

    @objc func re() {
        tableView.reloadData()

    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell") as! BasicCell
        let button = cell.viewWithTag(1) as! UIButton
        button.addTarget(self, action: #selector(re), for: .touchUpInside)
    
        return cell
    }
    
    
}
