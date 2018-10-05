//
//  AppEnums.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation


public enum SideMenuAppOptions : String{
    
    case home = "HOME"
    case settings = "SETTINGS"
    case logout = "LOGOUT"
    
    
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    static let enumArray = [home, settings, logout]
    
    
    static let count: Int = {
        return SideMenuAppOptions.logout.hashValue + 1
    }()
    
    static func valueAtIndex(index : Int) -> String {
        return SideMenuAppOptions.enumArray[index].value
    }
    
}


