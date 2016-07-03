//
//  AppDelegate.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 30/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let searchControl = CardsSearchViewController(nibName: "CardsSearchViewController", bundle:  nil)
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = searchControl
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

