//
//  Sequence.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation

public extension Sequence where Iterator.Element: Hashable {
	var uniqueElements: [Iterator.Element] {
		return Array(
			Set(self)
		)
	}
}
public extension Sequence where Iterator.Element: Equatable {
	var uniqueElements: [Iterator.Element] {
		return self.reduce([]) { uniqueElements, element in
			
			uniqueElements.contains(element)
				? uniqueElements
				: uniqueElements + [element]
		}
	}
}
