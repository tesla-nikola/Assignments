//
//  UICollectionView.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeCell<T: UICollectionViewCell>(cellClass: T.Type, at indexPath: IndexPath) -> T {
        let reusableID = (cellClass as UICollectionViewCell.Type).indentifire
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: reusableID, for: indexPath) as? T else {
            fatalError("Please check your cell's ID is same as it's class name")
        }
        return cell
    }
    
    func dequeResulableView<T: UICollectionReusableView>(kind: String, viewClass: T.Type, at indexPath: IndexPath) -> T {
        let reusableID = (viewClass as UICollectionReusableView.Type).indentifire
        
        guard let view = dequeueReusableSupplementaryView(ofKind: kind,
                                                          withReuseIdentifier: reusableID, for: indexPath) as? T else {
            fatalError("Please check your cell's ID is same as it's class name")
        }
        return view
    }
}
