//
//  DetailBottomView.swift
//  TYCase
//
//  Created by Getir on 19.05.2022.
//

import UIKit

final class DetailBottomView: NibView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var addToCartButton: UIButton!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var discountInfoLabel: UILabel!
    
    func configure(price: String, discountInfo: String) {
        priceLabel.text = price
        discountInfoLabel.text = discountInfo
    
        addToCartButton.layer.cornerRadius = Constants.Style.addToCartRadius
    }
}
