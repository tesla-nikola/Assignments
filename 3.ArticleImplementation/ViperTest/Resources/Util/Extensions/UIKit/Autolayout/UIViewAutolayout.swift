//
//  UIView.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import UIKit

public extension UIView {

    // UIView class function to create an view with 
    // translateAutoResizingMaskIntoConstraints is disabled
    class func autolayoutView() -> Self {
        let view = self.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIEdgeInsets {
    init(margin: CGFloat) {
		self.init()
		self.top = margin
        self.bottom = margin
        self.left = margin
        self.right = margin
    }
    init(sidePadding: CGFloat, verticalPadding: CGFloat) {
		self.init()
		self.top = verticalPadding
        self.bottom = verticalPadding
        self.left = sidePadding
        self.right = sidePadding
    }
}
