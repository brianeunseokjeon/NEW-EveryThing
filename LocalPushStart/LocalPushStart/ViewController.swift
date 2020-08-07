//
//  ViewController.swift
//  LocalPushStart
//
//  Created by Brian on 12/06/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tf: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let userNotificationCenter = UNUserNotificationCenter.current()

    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        userNotificationCenter.delegate = self
        requestNotificationAuthorization()
        sendNotification(seconds: 10)
        

    }

    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
        
        userNotificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                //허용안한 사람을알수 있는 방법
                print("Notifications not allowed")
            }
        }
    }

   func sendNotification(seconds: Double) {
    count += 1
        let notificationContent = UNMutableNotificationContent()

        notificationContent.title = "알림 \(count) 번째야~~~~~~"
        notificationContent.body = "이것은 \(count)번째야~ 알림을 테스트 하는 것이다"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)

//        userNotificationCenter.add(request) { error in
//            if let error = error {
//                print("Notification Error: ", error)
//            }
//        }
    }
    
    
    

    @IBAction func buttonPressed(_ sender: Any) {
            let content = UNMutableNotificationContent()

            //Setting content of the notification
            content.title = "고혈압 약을 먹을 타이틀"
            content.subtitle = "서브 타이트This is Subtitle : UserNotifications tutorial"
            content.body = "바디엔 약먹으세요~"
            content.badge = 1
            content.summaryArgument = "Alan Walker"
            content.summaryArgumentCount = 40
            
            //Setting time for notification trigger
            //블로그 예제에서는 TimeIntervalNotificationTrigger을 사용했지만, UNCalendarNotificationTrigger사용법도 같이 올려놓을게요!
            
            //1. Use UNCalendarNotificationTrigger
//            let date = Date(timeIntervalSinceNow: 70)
//            var dateCompenents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//
//            let calendartrigger = UNCalendarNotificationTrigger(dateMatching: dateCompenents, repeats: true)
            
        guard let time = tf.text else { return }
        
            //2. Use TimeIntervalNotificationTrigger
        
//        guard Date() < datePicker.date else {
//            print("오류")
//            return
//        }
        
        
        print(datePicker.date.timeIntervalSinceNow)
        
//        let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(time) as! TimeInterval, repeats: false)
        
       var date = DateComponents()
        
       date.hour = 9
       date.minute = 0
        print("Date :",date)
       let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        
            //Adding Request
            // MARK: - identifier가 다 달라야만 Notification Grouping이 됩니닷..!!
        let request = UNNotificationRequest(identifier: "1111", content: content, trigger: trigger)
    
        
        userNotificationCenter.add(request) { (error) in
            print("노티 에러 :",error)
        }
        
            
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)
    }



    @IBAction func deleteRequest(_ sender: Any) {
        userNotificationCenter.removePendingNotificationRequests(withIdentifiers: ["timerdone"])

    }
    
    
}

//extension ViewController: UNUserNotificationCenterDelegate {
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                didReceive response: UNNotificationResponse,
//                                withCompletionHandler completionHandler: @escaping () -> Void) {
//        completionHandler()
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.alert, .badge, .sound])
//    }
//    
////    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
////           let settingsViewController = UIViewController()
////        settingsViewController.view.backgroundColor = .blue
////           self.present(settingsViewController, animated: true, completion: nil)
////
////       }
//}
