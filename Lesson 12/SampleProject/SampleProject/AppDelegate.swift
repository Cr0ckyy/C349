//
//  AppDelegate.swift
//  SampleProject
//
//  Created by 19013345 Ju Long on 11/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                
            }
            
            let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION", title: "Accept", options: UNNotificationActionOptions(rawValue: 0))
            let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION", title: "Decline", options: UNNotificationActionOptions(rawValue: 0))
            
            let meetingInviteCategory = UNNotificationCategory(identifier: "MEETING_INVITATION", actions: [acceptAction, declineAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
            
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.setNotificationCategories([meetingInviteCategory])
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        let meetingID = userInfo["MEETING_ID"] as! String
        let userID = userInfo["USER_ID"] as! String
        
        if response.actionIdentifier == "ACCEPT_ACTION" {
            print("\(userID) accept \(meetingID)")
        } else if response.actionIdentifier == "DECLINE_ACTION" {
            print("\(userID) decline \(meetingID)")
        } else {
            print("neither button was selected")
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

