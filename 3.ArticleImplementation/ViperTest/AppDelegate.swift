//
//  AppDelegate.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appDependencies = AppDependencies.shared


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        appDependencies.installRootViewControllerIntoWindow(window!)

        return true
    }

}

