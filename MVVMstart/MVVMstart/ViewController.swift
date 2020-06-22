//
//  ViewController.swift
//  MVVMstart
//
//  Created by 맥북프로에임메드 on 09/06/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import UIKit


/* 도움 받은 사이트
 https://m.blog.naver.com/PostView.nhn?blogId=hobin1019&logNo=221616197346&proxyReferer=https:%2F%2Fwww.google.com%2F
 */


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MvvmViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func btnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
}
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.peopleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellInstance(tableView, indexPath: indexPath)
    }
    
    
}

class MvvmTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var etc: UILabel!
    
    
    func setup(person: Person) {
        self.name.text = person.name
        self.age.text = "\(person.age)"
        self.etc.text = "\(person.height) / \(person.weight)"
    }
}
