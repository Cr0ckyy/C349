//
//  ViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 11/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    var type = "Add"
    var reminders: [Reminder]?
    var reminder: Reminder?
    var index: Int?
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var outTextField: UITextField!
    @IBOutlet weak var outDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if reminders == nil {
            reminders = []
        }
        
        if let reminder = reminder {
            type = "Edit"
            navigationTitle.title = "Edit Reminder"
            outTextField.text = reminder.title
            outDatePicker.date = reminder.date_due
        }
    }
    
    @IBAction func saveData(_ sender: UIBarButtonItem) {
        let text = outTextField.text
        let date = outDatePicker.date
        let center = UNUserNotificationCenter.current()
        let uuid = UUID().uuidString
        
        if let text = text,
           text != "" {
            center.getNotificationSettings { settings in
                guard settings.authorizationStatus == .authorized else {
                    return
                }
                
                let content = UNMutableNotificationContent()
                content.title = text
                content.sound = UNNotificationSound.default
                
                var trigger: UNCalendarNotificationTrigger? = nil
                if date > Date() {
                    let calendar = Calendar.current
                    let dateComponent = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
                    trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
                }
                
                if (trigger != nil) {
                    let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
                    
                    let notificationCenter = UNUserNotificationCenter.current()
                    notificationCenter.add(request) { (error) in
                        if error != nil {
                            fatalError("\(error)")
                        }
                    }
                }
                print("Notification set")
            }
            
            let reminder = Reminder(uuid, text, date)
            if self.type == "Add" {
                 reminders?.append(reminder)
             } else {
                 reminders?[index ?? 0] = reminder
                 center.removePendingNotificationRequests(withIdentifiers: [uuid])
             }
            
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("L12_PS.json")
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(reminders)
                try data.write(to: url)
            } catch {
                print(error)
            }
            
        } else {
            let alert = UIAlertController(title: "No title is written", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        self.performSegue(withIdentifier: "unwind", sender: self)
    }
}

