//
//  AppDelegate.swift
//  Z7M8C9A2
//
//  Created by Carlos Corchado on 05/09/22.
//

import UIKit
import FirebaseCore
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var navController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        window = UIWindow()
        
        let viewOnboard = UserDefaults().bool(forKey: "ViewOnboard")
        var mainVC: UIViewController? = nil
        
        if viewOnboard {
            mainVC = RegisterViewController()
        } else {
            mainVC =  StartOnboardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }
        
        navController = UINavigationController(rootViewController: mainVC!)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        //Registro para notificaciones push
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self

        Messaging.messaging().token { token, error in
          if let error = error {
            print("Error fetching FCM registration token: \(error)")
          } else if let token = token {
            print("FCM registration token: \(token)")
          }
        }
        
        return true
    }

}

extension AppDelegate: MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("FCM registration token: \(fcmToken ?? "Sin token")")
    }
}

