//
//  BottomSheetViewController.swift
//  UI_bottomSheet
//
//  Created by brian on 30/07/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit
enum BottomSheetState {
    case top
    case middle
    case end
}
class BottomSheetViewController: UIViewController {
    let headerView = UIView()
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    var sheetState:BottomSheetState = .end
    var fullView: CGFloat = 0
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - 300
    }
    var endView: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        prepareBackgroundView()
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fullView = view.safeAreaInsets.top
    }
    
    func appearBottomSheet() {
        sheetState = .middle
        UIView.animate(withDuration: 0.4, animations: { [weak self] in
            let frame = self?.view.frame
            let yComponent = self?.partialView
            print(yComponent)
            self?.view.frame = CGRect(x: 0, y: yComponent!, width: frame!.width, height: UIScreen.main.bounds.height - 300)
        })
    }
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        
        let y = self.view.frame.minY
        self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: UIScreen.main.bounds.height)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if recognizer.state == .ended {
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: .allowUserInteraction, animations: {
                if  velocity.y >= 0 { // 화면이 내려가야함.
                    switch self.sheetState {
                    case .top:
                        print("여기로 들어와111111 ,:","속도 :",velocity.y,"y값 :",translation.y + y)
                        self.sheetState = .middle
                        self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
                    default:
                        if translation.y + y <= self.partialView && translation.y + y > (self.fullView + self.partialView)/2{
                            print("여기로 들어와222222222 ,:","속도 :",velocity.y,"y값 :",translation.y + y)
                            self.sheetState = .middle
                            self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
                        } else if translation.y + y <= (self.fullView + self.partialView)/2 {
                            print("여기로 들어와3333333 ,:","속도 :",velocity.y,"y값 :",translation.y + y)
                            self.sheetState = .top
                            self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
                        } else {
                            print("여기로 들어와44444444,:","속도 :",velocity.y,"y값 :",translation.y + y)
                            self.sheetState = .end
                            self.view.frame = CGRect(x: 0, y: self.endView, width: self.view.frame.width, height: self.view.frame.height)
                        }
                        
                    }
                }
                else {
                    print("여기로 들어와5555555 ,:","속도 :",velocity.y,"y값 :",translation.y + y)
                    self.sheetState = .top
                    self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
                }
            }, completion: {[weak self] _ in
                if self?.sheetState == .top {
                    self?.tableView.isScrollEnabled = true
                }
                
            })
            
        }
    }
    
    
    
}
extension BottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default")!
        cell.textLabel?.text = "오늘은 \(indexPath.row) skdml"
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
        }
    }
}

extension BottomSheetViewController: UIGestureRecognizerDelegate {
    
    // Solution
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
        let direction = gesture.velocity(in: view).y
        
        let y = view.frame.minY
        if (y == fullView && tableView.contentOffset.y == 0 && direction > 0) || (y == partialView) {
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
        
        return false
    }
    
}


extension BottomSheetViewController {
    
    private func makeUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "default")
        searchBar.isUserInteractionEnabled = false
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headerView.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func prepareBackgroundView(){
        let blurEffect = UIBlurEffect.init(style: .dark)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)
        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds
        view.insertSubview(bluredView, at: 0)
    }
}
