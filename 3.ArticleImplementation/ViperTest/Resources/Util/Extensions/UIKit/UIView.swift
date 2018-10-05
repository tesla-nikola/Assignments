//
//  UIView.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation
import UIKit

private enum Axis: StringLiteralType {
	case x = "x"
	case y = "y"
}

extension UIView {
	private func shake(on axis: Axis) {
		let animation = CAKeyframeAnimation(keyPath: "transform.translation.\(axis.rawValue)")
		animation.timingFunction = CAMediaTimingFunction(name: .linear)
		animation.duration = 0.6
		animation.values = [-20, 20, -20, 20, -10, 10, -5, 5, 0]
		layer.add(animation, forKey: "shake")
	}
	func shakeOnXAxis() {
		self.shake(on: .x)
	}
	func shakeOnYAxis() {
		self.shake(on: .y)
	}
}
