//
//  AppDelegate.swift
//  swiftDemo
//
//  Created by 镭速iOS on 4/2/21.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootTableBarVC: MainTableBarController?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds);

        rootTableBarVC = MainTableBarController()

        window?.rootViewController = rootTableBarVC!
        
        window?.backgroundColor = UIColor.white
        
        window?.makeKeyAndVisible();
        
        return true
    }

}
