//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class StampView: NibView {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var stampImageView: UIImageView!
    @IBOutlet private weak var stampLabel: UILabel!

    func configure(title: String,
                   titleColor: UIColor = .black,
                   backgroundColor: UIColor?,
                   cornerRadius: CGFloat = 5,
                   image: UIImage? = nil) {
        contentView.backgroundColor = backgroundColor
        contentView.layer.cornerRadius = cornerRadius
        stampLabel.text = title
        stampLabel.textColor = titleColor

        guard let image = image else {
            imageContainerView.isHidden = true
            return
        }
        stampImageView.image = image
    }
}

