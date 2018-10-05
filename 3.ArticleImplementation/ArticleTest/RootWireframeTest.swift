//
//  RootWireframeTest.swift
//  ArticleTest
//
//  Created by User-81-Mac on 04/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import XCTest
@testable import ViperTest

class RootWireframeTest: XCTestCase {
	
	var rootWireFrame: RootWireframe?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		super.setUp()
		rootWireFrame = RootWireframe()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		rootWireFrame = nil
    }
	
	func testShowRootViewController() {
		let controller = UIViewController()
		let window = UIWindow()
		rootWireFrame?.showRootViewController(controller, inWindow: window)
		if let rootVC = window.rootViewController as? UINavigationController {
			if let firstVC = rootVC.viewControllers[0] as? UIViewController {
				XCTAssertEqual(firstVC, controller, "rootViewController should be the one I set")
			} else {
				XCTFail("the first element of the viewcontrollers array must be a UIViewController")
			}
		} else {
			XCTFail("window's root view controller must be a navigation controller")
		}
	}

}
