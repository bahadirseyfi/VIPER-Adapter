//
//  UICollectionViewCell+Extension.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
