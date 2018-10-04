//
//  AppDelegateTest.swift
//  ArticleTest
//
//  Created by User-81-Mac on 04/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import XCTest
@testable import ViperTest

class AppDelegateTest: XCTestCase {
	
	var appDelegate = AppDelegate()
	var window: UIWindow? = UIWindow()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		super.setUp()
		appDelegate.window = window
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
		window = nil
    }
	
	func testAppDependencyNilOrNot() {
		XCTAssertNotNil(appDelegate.appDependencies,"App Dependency cannot be nil")
	}
	

	
	func testThatDidFinishLaunchingWithOptionsReturnsTrue() {
		XCTAssertTrue(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil), "should return true from didFinishLaunchingWithOptions")
	}
}
