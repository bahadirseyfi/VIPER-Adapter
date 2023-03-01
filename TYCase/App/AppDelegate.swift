//
//  AppDelegate.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = .init(frame: UIScreen.main.bounds)
    var tyTabbarController = TYTabBarController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tyTabbarController
        window?.makeKeyAndVisible()
        return true
    }
}

