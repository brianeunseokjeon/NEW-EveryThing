//
//  ViewController.swift
//  UI_FloderTableView
//
//  Created by brian on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {
    let viewmodel = SideFAQViewModel()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    private func makeUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmodel.tableViewData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewmodel.tableViewData[section].opened {
            return viewmodel.tableViewData[section].FAQSectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
            cell.textLabel?.text = viewmodel.tableViewData[indexPath.section].FAQTitle
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
            cell.textLabel?.text = viewmodel.tableViewData[indexPath.section].FAQSectionData[indexPath.row-1].question
            return cell
            
        }
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewmodel.tableViewData[indexPath.section].opened == true {
            viewmodel.tableViewData[indexPath.section].opened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        } else {
            viewmodel.tableViewData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)

        }
    }
}
