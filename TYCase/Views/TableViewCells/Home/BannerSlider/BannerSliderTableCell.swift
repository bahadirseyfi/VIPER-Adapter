//
//  BannerSliderTableCell.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class BannerSliderTableCell: UITableViewCell, TableViewCell {

    @IBOutlet private weak var bannerSliderCollectionView: UICollectionView!
    
    private var products: [BannerContent]?
    private var displayCount: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerSliderCollectionView.delegate = self
        bannerSliderCollectionView.dataSource = self
        bannerSliderCollectionView.register(cellType: BannerSliderCollectionCell.self)
    }
    
    func setData(data: Any?) {
        guard let products = data as? [BannerContent] else { return }
        self.products = products
    }
    
    func setDisplayCount(_ displayCount: Int?) {
        guard let displayCount = displayCount else {
            return
        }
        self.displayCount = displayCount
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BannerSliderTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.frame.size.width - 60) / (CGFloat(displayCount ?? 0) - 1)
        return CGSize(width: width, height: self.frame.height - 30)
    }
}

// MARK: - UICollectionViewDataSource
extension BannerSliderTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bannerSliderCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.System.Controller.bannerSliderCollectionCell,
                                                                        for: indexPath) as? BannerSliderCollectionCell else {
            fatalError("Error:  BannerSliderCollectionCell")
        }
        
        if let product = products?[indexPath.item] {
            cell.setCell(product: product)
        }
        
        return cell
    }
}
