//
//  ArticlesListProtocols.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol ArticlesListViewProtocol: class {
    var presenter: ArticlesListPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
	
	func startActivityIndicator()
	func stopActivityIndicator()
	func reloadData(data: ArticleFeedResponse)
}

//MARK: Wireframe -
protocol ArticlesListWireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func presentArticlesListModule(fromWindow window: UIWindow)
    func presentArticlesListModule(fromNavView view: UINavigationController)
    func presentArticlesListModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}

//MARK: Presenter -
protocol ArticlesListPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */

	func loadArticleDataFromServer()
	func fetchDataError(error: APIError)
	func fetchDataSuccessful(withData data: ArticleFeedResponse)
}

//MARK: Interactor -
protocol ArticlesListInteractorInputProtocol: class {
    
    var presenter: ArticlesListPresenterProtocol?  { get set }
    var APIDataManager: ArticlesListAPIDataManagerInputProtocol? { get set }
    var localDataManager: ArticlesListLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
	
	func loadArticlesFromServer()
}
protocol ArticlesListInteractorOutputProtocol: class {
    
    var presenter: ArticlesListPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
	func fetchDataError(error: APIError)
	func fetchDataSuccessful(withData data: ArticleFeedResponse)
}




//MARK: - DataManager -
protocol ArticlesListDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol ArticlesListAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
	func getFeed(from articleFeed: ArticleFeed, completion: @escaping (Result<ArticleFeedResponse?, APIError>) -> Void)
	
}

//MARK: Local -
protocol ArticlesListLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
