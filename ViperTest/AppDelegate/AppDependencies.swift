//
//  AppDependencies.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import UIKit

class AppDependencies {
    
    let rootWireframe = RootWireframe()
	let artilceListWireframe = ArticlesListWireframe()
	
	
	static let shared = AppDependencies()
    
    
    init() {
        configureDependencies()
    }
    
    
    /// Function to initialize root view controller of the app
    ///
    /// - Parameter window: UIWindow
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        // TODO: Which module is going to be presented?
        
//        loginWireFrame.presentLoginModule(fromWindow: window)
		artilceListWireframe.presentArticlesListModule(fromWindow: window)
		
    }
    
    
    
    func configureDependencies() {
        
        // ----------------------------------------------------------------
        //   configuring wireframe dependencies
        // ----------------------------------------------------------------
 
		artilceListWireframe.rootWireframe = rootWireframe
    }
    
    
}

