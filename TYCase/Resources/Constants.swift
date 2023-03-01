//
//  Constants.swift
//  TYCase
//
//  Created by Getir on 22.05.2022.
//

import UIKit

enum Constants {
    enum System {
        enum Storyboard {
            static let home = "Home"
            static let detail = "Detail"
        }
        
        enum Controller {
            static let homeViewController = "HomeViewController"
            static let detailViewController = "DetailViewController"
            static let bannerSliderCollectionCell = "BannerSliderCollectionCell"
            static let productListingCollectionCell = "ProductListingCollectionCell"
            static let productSliderCollectionCell = "ProductSliderCollectionCell"
        }
    }
    
    enum Style {
        static let brandNameSize: CGFloat = 20
        static let addToCartRadius: CGFloat = 5
        static let promotionListBoldFont: CGFloat = 15
    }
    
    enum Image {
        static let barImageName = "homekit"
    }
    
    enum Text {
        static let homeTitle = "Mobile Case"
    }
}
