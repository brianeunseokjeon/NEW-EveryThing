//
//  CustomTableViewController.swift
//  LocalPushStart
//
//  Created by Brian on 16/06/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class CustomTableViewController: UIViewController {
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        askPermission()
        
    }
    
    func askPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .alert, .badge]) { granted, _ in
            DispatchQueue.main.async {
                if granted {
                    //                    UIApplication.shared.registerForRemoteNotifications()
                } else {
                    // Handle error or not granted scenario
                }
            }
        }
    }
    var count = 0
    func addNoti(title:String,text:String,second:Int) {
        let content = UNMutableNotificationContent()
        
        //Setting content of the notification
        content.title = title
        content.subtitle = "This is Subtitle : UserNotifications tutorial"
        content.body = text
        content.badge = count as NSNumber
        content.summaryArgument = "Alan Walker"
        content.summaryArgumentCount = 40
        
        
        let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(second) , repeats: false)
        
        //Adding Request
        // MARK: - identifier가 다 달라야만 Notification Grouping이 됩니닷..!!
        let request = UNNotificationRequest(identifier: "\(second)", content: content, trigger: TimeIntervalTrigger)
        
        print("아이디",request.identifier)
        userNotificationCenter.add(request, withCompletionHandler: nil)
        
        //노티가 뭐뭐 있는지 확인 가능하군.
//        userNotificationCenter.getPendingNotificationRequests { (notis) in
//            print(notis)
//        }
    }
    
    
    
    
    
    
    
}
extension CustomTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath.row * 2 + 1)"
        if indexPath.row == 9 {
            cell.textLabel?.text = "Remove"
        }
        return cell
    }
    
    
}


extension CustomTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        let c = (cell.textLabel?.text)!
        guard let number = Int(c) else {
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: ["5","7"])
            print("리무브")
            return
        }
        count += 1
        addNoti(title: "타이틀은 \(indexPath.row)", text: "text는 :\(number)", second: number)
        
    }
}
