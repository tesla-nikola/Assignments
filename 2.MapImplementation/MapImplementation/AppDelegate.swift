//
//  AppDelegate.swift
//  MapImplementation
//
//  Created by Soham Ray on 30/09/18.
//  Copyright © 2018 Soham Ray. All rights reserved.
//

import UIKit
import GoogleMaps
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyDvyszS-78COG5QVvTnMaxNWNVSgOErxuo")
        return true
    }
}

