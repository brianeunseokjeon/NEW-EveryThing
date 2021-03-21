//
//  ViewController.swift
//  StickerHeader
//
//  Created by brian은석 on 2021/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var myView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.automaticallyAdjustsScrollIndicatorInsets = false
        let header = UIView(frame: CGRect(x: 0, y: 0, width:tableView.frame.width,                                    height: 100))
        header.backgroundColor = .clear
        tableView.tableHeaderView = header
        tableView.delegate = self
    
        view.addSubview(myView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        view.layoutIfNeeded()
        myView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: 100)
        myView.backgroundColor = .red

    }
    
}


extension ViewController: UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollOffset = scrollView.contentOffset.y
        var headerFrame = self.myView.frame
        
        if scrollOffset < 0 {
            headerFrame.origin.y = view.safeAreaInsets.top
        } else if scrollOffset > 80 {
            let percentage = (-scrollOffset-80)/20
            myView.alpha = percentage
        } else{
            headerFrame.origin.y = view.safeAreaInsets.top - scrollOffset
        }
        
        self.myView.frame = headerFrame
    }

}
