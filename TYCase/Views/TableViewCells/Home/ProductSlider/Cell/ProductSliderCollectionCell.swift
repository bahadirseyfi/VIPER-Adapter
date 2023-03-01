//
//  ProductSliderCollectionCell.swift
//  TYCase
//
//  Created by Getir on 30.04.2022.
//

import UIKit

class ProductSliderCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "ProductSliderCollectionCell"

    @IBOutlet weak var productSliderImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
    }
    
    private func setupShadow() {
        backgroundColor = .white
        layer.cornerRadius = 5.0
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }

    func setCell(product: ProductElement) {
        productTitle.text = product.brandName
        productDescription.text = product.name
        productSliderImage.sd_setImage(with: product.imageUrl)
    }
}
