//
//  AppDelegate.swift
//  Foodie
//
//  Created by Sachin Raut on 18/05/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit

var location = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        setupDefaultColors()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
    }
    
    func setupDefaultColors()
    {
        UITabBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.darkGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .selected)
        
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        UITabBar.appearance().isTranslucent = false
        UINavigationBar.appearance().isTranslucent = false
    }

}

