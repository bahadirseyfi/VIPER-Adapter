//
//  BannerSliderCollectionCell.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit
import SDWebImage

final class BannerSliderCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "BannerSliderCollectionCell"

    @IBOutlet private weak var bannerImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(product: BannerContent) {
        titleLabel.text = product.title
        if let url = product.imageURL {
            bannerImage.sd_setImage(with: URL(string: url))
        }
    }
}
