//
//  Endpoint.swift
//  ViperTest
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation

protocol Endpoint {
	var base: String { get }
	var path: String { get }
}
extension Endpoint {
	var urlComponents: URLComponents {
		var components = URLComponents(string: base)!
		components.path = path
		return components
	}
	
	var request: URLRequest {
		let url = urlComponents.url!
		return URLRequest(url: url)
	}
}
