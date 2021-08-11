//
//  ViewController.swift
//  SampleProject
//
//  Created by 19013345 Ju Long on 11/8/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIApplication.shared.applicationIconBadgeNumber = 99
        
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings() { settings in
            guard (settings.authorizationStatus == .authorized) else {
                return
            }
            
            let meetingID = "WSM_TUE_2PM"
            let userID = "david_tan"
            
            let content = UNMutableNotificationContent()
            content.title = "Weekly Staff Meeting"
            content.body = "Every Tuesday at 2pm"
            content.userInfo = ["MEETING_ID": meetingID,
                                "USER_ID": userID]
            content.categoryIdentifier = "MEETING_INVITATION"
            content.sound = UNNotificationSound.default
            content.badge = 1
            
//            let date = Date().addingTimeInterval(TimeInterval(10))
//            let calendar = Calendar.current
//            let dateComponent = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
                if error != nil {
                    fatalError("notification center error")
                }
            }
            
            center.removePendingNotificationRequests(withIdentifiers: [uuidString])
        }
    }


}

