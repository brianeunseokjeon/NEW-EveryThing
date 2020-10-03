//
//  ViewController.swift
//  DaumComicToon
//
//  Created by Brian on 22/04/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    lazy var myTableViewHeight = {
        return self.myTableView.bounds.size.height
    }()
    var cellArrays: [BasicTableViewCell] = []
    
    let myImageView = UIImageView()
    var headerView: UIImageView!
    var kTableHeaderHeight:CGFloat = 300.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.tableHeaderView = myImageView
        myImageView.image = UIImage(named: "image2")
        
        headerView = myTableView.tableHeaderView as? UIImageView
                myTableView.tableHeaderView = nil
                myTableView.addSubview(myImageView)
                myTableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
                myTableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
    }

    
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: myTableView.bounds.width, height: kTableHeaderHeight)
         if myTableView.contentOffset.y < -kTableHeaderHeight {
                    headerRect.origin.y = myTableView.contentOffset.y
                    headerRect.size.height = -myTableView.contentOffset.y
               
         } else if myTableView.contentOffset.y > -kTableHeaderHeight {
            self.myTableView.contentInset.top = -scrollView.contentOffset.y

            if scrollView.contentOffset.y > 0 {
                    self.myTableView.contentInset.top = 0
                }
         }
                
        headerView.frame = headerRect
//        if scrollView.contentOffset.y < -280 {
////            myTableView.contentInset.top = 100
//        } else {
//            if 300 - scrollView.contentOffset.y > 0 {
//                DispatchQueue.main.async {
//                    self.myTableView.contentInset.top = 300 - scrollView.contentOffset.y
//                    print("????",scrollView.contentOffset.y,300 - scrollView.contentOffset.y)
//                }
//            }
//        }
        
        guard let cell = myTableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? BasicTableViewCell else { return }
//        print("aaa:",cell.frame.origin.y, scrollView.contentOffset.y,scrollView.contentOffset.y + scrollView.bounds.height - 100)
//        print("bbb:",cell.topScrollView.bounds.origin.y)
        let topScrollView = cell.topScrollView!
        let secondScrollView = cell.secondScrollView!
        let bottomScrollView = cell.bottomScrollView!
//        print("dddd: ", topScrollView.bounds.origin.y, secondScrollView.bounds.origin.y)
//        print("gggg: ",cell.frame.origin.y - scrollView.contentOffset.y)
//        print("등장시기 : ",cell.frame.origin.y - scrollView.contentOffset.y > scrollView.bounds.height - 80)
        let contentHeight = topScrollView.contentSize.height - topScrollView.bounds.size.height + topScrollView.contentInset.top
        let ratio = 220 / myTableViewHeight
        let basic = cell.frame.origin.y - scrollView.contentOffset.y
        let differencial:CGFloat = 120
        
        if basic < scrollView.bounds.height - 80 && cell.frame.origin.y - scrollView.contentOffset.y > 0 {
            DispatchQueue.main.async {
                topScrollView.setContentOffset(CGPoint(x: 0, y: contentHeight - (scrollView.contentOffset.y * ratio)), animated: false)
            }
        }
        if basic + differencial < scrollView.bounds.height - 80 && cell.frame.origin.y + differencial - scrollView.contentOffset.y > 0 {
                   DispatchQueue.main.async {
                       secondScrollView.setContentOffset(CGPoint(x: 0, y: contentHeight + 40 - (scrollView.contentOffset.y * ratio)), animated: false)
                   }
               }
        if basic + 2*differencial < scrollView.bounds.height - 80 && cell.frame.origin.y + 2*differencial  - scrollView.contentOffset.y > 0 {
                   DispatchQueue.main.async {
                       bottomScrollView.setContentOffset(CGPoint(x: 0, y: contentHeight + 80 - (scrollView.contentOffset.y * ratio)), animated: false)
                   }
               }
    }
    

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "gg"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath) as! BasicTableViewCell
        cell.myTag = indexPath.row
        return cell 
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellArrays.append(cell as! BasicTableViewCell)
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellArrays.removeAll { (cellInArray) -> Bool in
            return cellInArray == cell as! BasicTableViewCell
        }
        
        
    }
    
    
}


