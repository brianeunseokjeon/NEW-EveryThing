//
//  BottomSheet.swift
//  UI_bottomSheet
//
//  Created by brian on 29/07/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class BottomSheet: UIView {

    let topLine = UIView()
    let containView = UIView()
    let searchContainView = UIView()
//    let searchImageView = UIImageView()
    let searchTextField = UITextField()
    let searchTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
        searchTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    private func makeUI() {
        self.addSubview(topLine)
        topLine.translatesAutoresizingMaskIntoConstraints = false
        topLine.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        topLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        topLine.heightAnchor.constraint(equalToConstant: 6).isActive = true
        topLine.widthAnchor.constraint(equalToConstant: 60).isActive = true
        topLine.backgroundColor = .lightGray
        
        self.addSubview(containView)
        containView.translatesAutoresizingMaskIntoConstraints = false
        containView.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 10).isActive = true
        containView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containView.backgroundColor = .darkGray
        
        containView.addSubview(searchContainView)
        searchContainView.translatesAutoresizingMaskIntoConstraints = false
        searchContainView.topAnchor.constraint(equalTo: containView.topAnchor, constant: 10).isActive = true
        searchContainView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        searchContainView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20).isActive = true
        searchContainView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchContainView.backgroundColor = .gray
        
        searchContainView.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.leadingAnchor.constraint(equalTo: containView.leadingAnchor,constant: 50).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: containView.trailingAnchor, constant: -10).isActive = true
        searchTextField.centerYAnchor.constraint(equalTo: searchContainView.centerYAnchor).isActive = true
        searchTextField.placeholder = "검색"
        
        containView.addSubview(searchTableView)
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.topAnchor.constraint(equalTo: searchContainView.bottomAnchor, constant: 20).isActive = true
        searchTableView.leadingAnchor.constraint(equalTo: containView.leadingAnchor).isActive = true
        searchTableView.trailingAnchor.constraint(equalTo: containView.trailingAnchor).isActive = true
        searchTableView.bottomAnchor.constraint(equalTo: containView.bottomAnchor).isActive = true
        searchTableView.dataSource = self
        searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    var tempArray = ["A","B","C","D","E","F","GF","ADFAF","afadfadf","adfadfa","ffff","Adfafadf","Adfadfdaf","adfadfa","ffff","Adfafadf","Adfadfdaf","adfadfa","ffff","Adfafadf","Adfadfdaf","adfadfa","ffff","Adfafadf","Adfadfdaf"]
}
extension BottomSheet: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tempArray[indexPath.row]
        return cell
    }
    
    
}

extension BottomSheet: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchTextField.endEditing(true)
    }
}
