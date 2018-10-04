//
//  AppDependenciesTest.swift
//  ArticleTest
//
//  Created by User-81-Mac on 04/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import XCTest
@testable import ViperTest

class AppDependenciesTest: XCTestCase {
	
	var appDependency = AppDependencies()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testToShowArticleViewController() {
		let window = UIWindow()
		appDependency.installRootViewControllerIntoWindow(window)
		
		if let rootVC = window.rootViewController as? UINavigationController{
			if let articleListVC = rootVC.viewControllers[0] as? UIViewController {
				XCTAssertNotNil(articleListVC as? ArticlesListView, "must be a articlelist view controller")
			} else {
				XCTFail("first view controller must be a view controller")
			}
		} else {
			XCTFail("window must have a rootViewController that is a navigation controller")
		}
	}
}
