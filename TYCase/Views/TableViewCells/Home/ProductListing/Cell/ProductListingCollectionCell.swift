//
//  ProductListingCollectionCell.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit
import SDWebImage

final class ProductListingCollectionCell: UICollectionViewCell {

    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var discountInfoLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    @IBOutlet private weak var imageSliderView: ImageSliderView!
    @IBOutlet private weak var starView: StarRatingView!
    @IBOutlet private weak var promotionCollectionView: UICollectionView!
    
    private var product: ProductElement?
    
    static let reuseIdentifier: String = "ProductListingCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupCollectionView()
    }
    
    func setCell(product: ProductElement) {
        self.product = product
        loadElements()
    }
    
    private func setupCollectionView() {
        promotionCollectionView.delegate = self
        promotionCollectionView.dataSource = self
        
        promotionCollectionView.register(cellType: PromotionViewCell.self)
    }
    
    private func setupUI() {
        
        // MARK: UI
        backgroundColor = .white
        layer.cornerRadius = 5.0
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }
    
    private func loadElements() {
        
        // BANNER IMAGE
        guard let imageURLs = product?.imageUrls?.prefix(3) else { return }
        let imageSliderPresenter = ImageSliderViewPresenter(imageUrls: imageURLs.reversed(),
                                                            loopingEnabled: true,
                                                            view: imageSliderView)
        imageSliderView.contentMode = .scaleAspectFit
        imageSliderView.presenter = imageSliderPresenter
        
        titleLabel.attributedText = String.tyTitleFont(product?.brandName ?? "", normalString: product?.name ?? "", size: 12)

        discountInfoLabel.text = product?.discountedPriceInfo
        priceLabel.text = "\(product?.newDiscountedPrice ?? 0) TL"
        // Custom Star View
        starView.configure(rating: Int(product?.averageRating ?? 0))
    }
}

extension ProductListingCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product?.orderedPromotions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = promotionCollectionView.dequeueReusableCell(withReuseIdentifier: PromotionViewCell.reuseIdentifier, for: indexPath) as? PromotionViewCell else {
            fatalError("PromotionViewCell")
        }
        if let promotion = product?.orderedPromotions?[indexPath.item] {
            cell.configureCell(promotion: promotion)
        }
        
        return cell
    }
}

extension ProductListingCollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: 30, height: 40)
    }
}

extension ProductListingCollectionCell: UICollectionViewDelegate {
    
}
