//
//  ArticleListViewTest.swift
//  ArticleTest
//
//  Created by Soham Ray on 05/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import XCTest
@testable import ViperTest

class ArticleListViewTest: XCTestCase {
    
    var articleListView: ArticlesListView?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        articleListView = ArticlesListView.instantiate(fromAppStoryboard: .ArticleList)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testThatLoginViewControllerExists() {
        XCTAssertNotNil(articleListView, "a ArticleListView instance should be creatable from storyboard")
    }
    
    // MARK: viewDidLoad tests
    
    func testThatAfterViewDidLoadATableViewIsPresent() {
        articleListView?.view
        XCTAssertNotNil(articleListView?.tableView, "a tableView instance should be present")
    }
    
    func testThatAfterViewDidLoadTableviewHaveDelegate() {
        articleListView?.view
        XCTAssertNotNil(articleListView?.tableView?.delegate, "tableview should have a delegate")
    }
    
    func testThatAfterViewDidLoadTableviewHaveDatasource() {
        articleListView?.view
        XCTAssertNotNil(articleListView?.tableView?.dataSource, "tableview should have a dataSource")
    }
}
