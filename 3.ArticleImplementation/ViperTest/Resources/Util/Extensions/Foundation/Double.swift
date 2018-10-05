//
//  Double.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation

extension Double {
    func round(to: Int) -> Double {
        let divisor = pow(10.0, Double(to))
        return Darwin.round(self * divisor) / divisor
    }
}
