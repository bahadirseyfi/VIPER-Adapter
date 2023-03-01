//
//  StarRatingView.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class StarRatingView: NibView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    
    func configure(rating: Int) {
        var imageViews: [UIImageView]
        
        imageViews = (0..<rating).map { _ in
            let image = UIImageView(image: UIImage(named: "Star"))
            image.contentMode = .scaleAspectFit
            return image
        }
        
        let unFavViews: [UIImageView]
        
        unFavViews = (0..<5-rating).map { _ in
            let image = UIImageView(image: UIImage(named: "unstar"))
            image.contentMode = .scaleAspectFit
            return image
        }
        imageViews = imageViews + unFavViews
        for view in imageViews {
            stackView.addArrangedSubview(view)
        }
    }
}
