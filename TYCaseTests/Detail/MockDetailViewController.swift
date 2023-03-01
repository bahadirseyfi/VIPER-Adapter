//
//  MockDetailViewController.swift
//  TYCaseTests
//
//  Created by Getir on 21.05.2022.
//

import UIKit
@testable import TYCase

final class MockDetailViewController: DetailViewInterface {

    var invokedSetBrandName = false
    var invokedSetBrandNameCount = 0
    var invokedSetBrandNameParameters: (brandName: String, name: String)?
    var invokedSetBrandNameParametersList = [(brandName: String, name: String)]()

    func setBrandName(_ brandName: String, name: String) {
        invokedSetBrandName = true
        invokedSetBrandNameCount += 1
        invokedSetBrandNameParameters = (brandName, name)
        invokedSetBrandNameParametersList.append((brandName, name))
    }

    var invokedSetBottomView = false
    var invokedSetBottomViewCount = 0
    var invokedSetBottomViewParameters: (price: String, discountInfo: String)?
    var invokedSetBottomViewParametersList = [(price: String, discountInfo: String)]()

    func setBottomView(_ price: String, discountInfo: String) {
        invokedSetBottomView = true
        invokedSetBottomViewCount += 1
        invokedSetBottomViewParameters = (price, discountInfo)
        invokedSetBottomViewParametersList.append((price, discountInfo))
    }

    var invokedSetupPromotionView = false
    var invokedSetupPromotionViewCount = 0
    var invokedSetupPromotionViewParameters: (promos: [Promotion], Void)?
    var invokedSetupPromotionViewParametersList = [(promos: [Promotion], Void)]()

    func setupPromotionView(_ promos: [Promotion]) {
        invokedSetupPromotionView = true
        invokedSetupPromotionViewCount += 1
        invokedSetupPromotionViewParameters = (promos, ())
        invokedSetupPromotionViewParametersList.append((promos, ()))
    }

    var invokedSetupStarRatingView = false
    var invokedSetupStarRatingViewCount = 0
    var invokedSetupStarRatingViewParameters: (rating: Int, Void)?
    var invokedSetupStarRatingViewParametersList = [(rating: Int, Void)]()

    func setupStarRatingView(_ rating: Int) {
        invokedSetupStarRatingView = true
        invokedSetupStarRatingViewCount += 1
        invokedSetupStarRatingViewParameters = (rating, ())
        invokedSetupStarRatingViewParametersList.append((rating, ()))
    }

    var invokedPrepareUI = false
    var invokedPrepareUICount = 0

    func prepareUI() {
        invokedPrepareUI = true
        invokedPrepareUICount += 1
    }
}
