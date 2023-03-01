//
//  ProductListingTableCell.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

protocol ProductListingTableCellDelegate: AnyObject {
    func cellDidTapped(_ product: ProductElement)
}

final class ProductListingTableCell: UITableViewCell, TableViewCell {

    @IBOutlet private weak var productListingCollectionView: UICollectionView!
    
    private var products: Products? = []
    weak var delegate: ProductListingTableCellDelegate?
    
    var view: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productListingCollectionView.delegate = self
        productListingCollectionView.dataSource = self
        productListingCollectionView.register(cellType: ProductListingCollectionCell.self)
        productListingCollectionView.backgroundColor = .inactive
    }
    
    func setData(data: Any?) {
        guard let products = data as? Products else { return }
        self.products = products
    }
    
    func setUIController(view: UIViewController?) {
        guard let view = view else {
            return
        }
        self.view = view
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProductListingTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.frame.size.width - 40) / 2
        return CGSize(width: width, height: 340)
    }
}

// MARK: - UICollectionViewDataSource
extension ProductListingTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productListingCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.System.Controller.productListingCollectionCell, for: indexPath) as? ProductListingCollectionCell else {
            fatalError("ProductListingCollectionCell")
        }
        
        if let product = products?[indexPath.item] {
            cell.setCell(product: product)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = products?[indexPath.item] else { return }
        delegate?.cellDidTapped(product)
    }
}
