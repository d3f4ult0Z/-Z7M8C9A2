//
//  AppDelegate.swift
//  Z7M8C9A2
//
//  Created by Carlos Corchado on 05/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        let mainVC = StartViewController()
        navController = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }




}

