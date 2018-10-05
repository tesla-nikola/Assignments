//
//  ArticlesListWireframe.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//
//

import UIKit

class ArticlesListWireframe: ArticlesListWireframeProtocol {
    
    var rootWireframe: RootWireframe?
    var view: ArticlesListView!

    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = ArticlesListView.instantiate(fromAppStoryboard: .ArticleList)
        let interactor = ArticlesListInteractor()
        let presenter = ArticlesListPresenter(interface: view, interactor: interactor, wireframe: self)
        
        view.presenter = presenter
        interactor.presenter = presenter

    }
}

// MARK: ArticlesListWireframeProtocol
extension ArticlesListWireframe {
    func presentArticlesListModule(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    func presentArticlesListModule(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    // MARK: LoginWireframeProtocol
    func presentArticlesListModule(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }
}
