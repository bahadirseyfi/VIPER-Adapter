//
//  DetailPresenter.swift
//
//  Created by Bahadir on 19.05.2022.
//

import Foundation

protocol DetailPresenterInterface {
    func onLoad()
    func setupImageSlider(_ imageSlider: ImageSliderView)
}

final class DetailPresenter {
    
    weak var view: DetailViewInterface?
    private let interacator: DetailInteractorInterface
    
    private var product: ProductElement?
    
    init(view: DetailViewInterface, interactor: DetailInteractorInterface) {
        self.view = view
        self.interacator = interactor
    }
}

extension DetailPresenter: DetailPresenterInterface {
    
    func onLoad() {
        interacator.fetchProduct()
        view?.prepareUI()
        view?.setupPromotionView(product?.orderedPromotions ?? [])
        view?.setupStarRatingView(Int(product?.averageRating ?? 0))
        view?.setBrandName(product?.brandName ?? "", name: product?.name ?? "")
        view?.setBottomView(String().toTLCurrency(amount: product?.newDiscountedPrice ?? 0),
                            discountInfo: product?.discountedPriceInfo ?? "")
    }
    
    func setupImageSlider(_ imageSlider: ImageSliderView) {
        let imageSliderPresenter = ImageSliderViewPresenter(imageUrls: product?.imageUrls ?? [],
                                                            loopingEnabled: true,
                                                            view: imageSlider)
        imageSlider.presenter = imageSliderPresenter
    }
}

extension DetailPresenter: DetailInteractorOutput {
    func handleProductResult(_ product: ProductElement) {
        self.product = product
    }
}
