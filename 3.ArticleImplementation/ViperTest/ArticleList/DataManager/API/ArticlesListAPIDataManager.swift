//
//  ArticlesListAPIDataManager.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//
//

import UIKit

class ArticlesListAPIDataManager: APIClient, ArticlesListAPIDataManagerInputProtocol {

	var session: URLSession
	

	init(configuration: URLSessionConfiguration) {
		self.session = URLSession(configuration: configuration)
	}
	
	convenience init() {
		self.init(configuration: .default)
	}
	
	func getFeed(from articleFeed: ArticleFeed, completion: @escaping (Result<ArticleFeedResponse?, APIError>) -> Void) {
		fetch(with: articleFeed.request , decode: { json -> ArticleFeedResponse? in
			guard let articleFeedResponse = json as? ArticleFeedResponse else { return  nil }
			return articleFeedResponse
		}, completion: completion)
	}
}
