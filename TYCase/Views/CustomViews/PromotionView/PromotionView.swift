//
//  PromotionView.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class PromotionView: NibView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    
    func configure(promotionList: [Promotion]?) {
        
        var promos: [UILabel]
        
        guard let promotionList = promotionList else {
            return
        }
        
        contentView.layer.borderColor = UIColor.primary.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
        contentView.backgroundColor = .clear
        
        promos = promotionList.map { prom in
            let shortName = prom.shortname
            let label = UILabel()
            label.text = shortName
            label.contentMode = .scaleAspectFit
            label.font = .boldSystemFont(ofSize: Constants.Style.promotionListBoldFont)
            return label
        }
        
        promos.forEach { view in
            stackView.addArrangedSubview(view)
        }
    }
}
