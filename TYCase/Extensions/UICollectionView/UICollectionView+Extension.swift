//
//  UICollectionView+Extension.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//


import UIKit

extension UICollectionView {
    func register(cellType: UICollectionViewCell.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
    }
    func dequeCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
}
