//
//  DetailViewController.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

protocol DetailViewInterface: AnyObject {
    func setBrandName(_ brandName: String, name: String)
    func setBottomView(_ price: String, discountInfo: String)
    func setupPromotionView(_ promos: [Promotion])
    func setupStarRatingView(_ rating: Int)
    func prepareUI()
}

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var imageSlider: ImageSliderView!
    @IBOutlet private weak var starView: StarRatingView!
    @IBOutlet private weak var promotionView: PromotionView!
    @IBOutlet private weak var bottomView: DetailBottomView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rateCountLabel: UILabel!
    
    var presenter: DetailPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onLoad()
        presenter.setupImageSlider(imageSlider)
    }
}

extension DetailViewController: DetailViewInterface {
    func setupPromotionView(_ promos: [Promotion]) {
        promotionView.configure(promotionList: promos)
    }
    
    func setupStarRatingView(_ rating: Int) {
        starView.configure(rating: rating)
    }
    
    func setBrandName(_ brandName: String, name: String) {
        titleLabel.attributedText = String.tyTitleFont(brandName, normalString: name, size: Constants.Style.brandNameSize)
    }

    func setBottomView(_ price: String, discountInfo: String) {
        bottomView.configure(price: price, discountInfo: discountInfo)
    }
    
    func prepareUI() {
        view.backgroundColor = .inactive
        tabBarController?.tabBar.isHidden = true
        imageSlider.presentedImageView?.contentMode = .scaleAspectFit
    }
}
