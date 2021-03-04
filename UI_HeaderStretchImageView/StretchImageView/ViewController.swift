//
//  ViewController.swift
//  StretchImageView
//
//  Created by 맥북프로에임메드 on 2021/03/04.
//

import UIKit

class ViewController: UIViewController {

    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let models = [
        "New York",
        "London",
        "Hong Kong",
        "Korea",
        "New York",
        "London",
        "Hong Kong",
        "Korea",
        "New York",
        "London",
        "Hong Kong",
        "Korea",
        "New York",
        "London",
        "Hong Kong",
        "Korea",
        "New York",
        "London",
        "Hong Kong",
        "Korea",
        "New York",
        "London",
        "Hong Kong",
        "Korea"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.imageView.image = UIImage(named: "image")
        tableView.tableHeaderView = header
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
        }
        header.scrollViewDidScroll(scrollView: tableView)
    }
    
    
}
