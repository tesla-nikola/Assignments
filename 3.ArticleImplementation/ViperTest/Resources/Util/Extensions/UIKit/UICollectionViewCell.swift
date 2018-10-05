//
//  UICollectionViewCell.swift
//  ViperTest
//
//  Created User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation
import UIKit

//extension UICollectionViewCell {
//    override class var indentifire: String {
//        return "\(self)"
//    }
//    static func instantiateAsReusable(inCollectionView collectionView: UICollectionView,
//                                      at indexPath: IndexPath) -> Self {
//        return collectionView.dequeCell(cellClass: self, at: indexPath)
//    }
//}

extension UICollectionReusableView {
    class var indentifire: String {
        return "\(self)"
    }
    static func dequeue(kind: String, inCollectionView collectionView: UICollectionView,
                        at indexPath: IndexPath) -> Self {
        return collectionView.dequeResulableView(kind: kind, viewClass: self, at: indexPath)
    }
}
