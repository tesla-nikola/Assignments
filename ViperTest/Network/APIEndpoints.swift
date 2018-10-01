//
//  ArticleFeed.swift
//  ViperTest
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation


enum ArticleFeed {
	case articles
}
extension ArticleFeed: Endpoint {
	
	var base: String {
		return "https://s3.eu-west-2.amazonaws.com"
	}
	
	var path: String {
		switch self {
		case .articles:
			return "/interview-question-data/articles/articles.json"
		}
	}
}


