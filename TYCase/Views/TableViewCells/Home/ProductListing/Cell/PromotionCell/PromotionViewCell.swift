//
//  PromotionViewCell.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class PromotionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "PromotionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configureCell(promotion: Promotion) {
        imageView.sd_setImage(with: promotion.icon)
        imageView.contentMode = .scaleAspectFit
        titleLabel.text = promotion.shortname
    }
    
    func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 5.0
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.darkNasaBlue.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }
}
