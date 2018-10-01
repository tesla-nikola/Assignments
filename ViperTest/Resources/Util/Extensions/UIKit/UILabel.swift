//
//  UILabel.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import UIKit

extension UILabel {
	
	func startBlink() {
		UIView.animate(withDuration: 0.8,
		               delay:0.0,
		               options:[.autoreverse, .repeat],
		               animations: {
						self.alpha = 0
		}, completion: nil)
	}
	
	func stopBlink() {
		alpha = 1
		layer.removeAllAnimations()
	}
}
