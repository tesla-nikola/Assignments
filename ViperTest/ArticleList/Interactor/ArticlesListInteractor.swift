//
//  ArticlesListInteractor.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//
//

import UIKit

class ArticlesListInteractor: ArticlesListInteractorInputProtocol,
ArticlesListInteractorOutputProtocol{
    var presenter: ArticlesListPresenterProtocol?
    var APIDataManager: ArticlesListAPIDataManagerInputProtocol?
    var localDataManager: ArticlesListLocalDataManagerInputProtocol?
	
    init() {
        APIDataManager = ArticlesListAPIDataManager()
        localDataManager = ArticlesListLocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
	
	func loadArticlesFromServer() {
		APIDataManager?.getFeed(from: .articles, completion: { [weak self] (result) in
			guard let welf = self else {return}
			switch result {
			case .success(let articlesFeed):
				welf.fetchDataSuccessful(withData: articlesFeed!)
				break
			case .failure(let error):
				print(error.localizedDescription)
				welf.fetchDataError(error: error)
				break
			}
		})
	}
	
	func fetchDataError(error: APIError) {
		presenter?.fetchDataError(error: error)
	}
	
	func fetchDataSuccessful(withData data: ArticleFeedResponse) {
		presenter?.fetchDataSuccessful(withData: data)
	}
	
}
