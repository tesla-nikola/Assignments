//
//  ArticlesListPresenter.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//
//

import UIKit

class ArticlesListPresenter: ArticlesListPresenterProtocol {

    weak private var view: ArticlesListViewProtocol?
    private let interactor: ArticlesListInteractorInputProtocol
    private let wireframe: ArticlesListWireframeProtocol

    init(interface: ArticlesListView, interactor: ArticlesListInteractorInputProtocol, wireframe: ArticlesListWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        print("Hello darkness m old friend")
        self.wireframe = wireframe
        self.interactor.presenter = self
    }
	
	func loadArticleDataFromServer() {
		// call to interactor
		view?.startActivityIndicator()
		interactor.loadArticlesFromServer()
	}
	
	func fetchDataError(error: APIError) {
		view?.stopActivityIndicator()
	}
	
	func fetchDataSuccessful(withData data: ArticleFeedResponse) {
		view?.reloadData(data: data)
		view?.stopActivityIndicator()
	}
	
}
