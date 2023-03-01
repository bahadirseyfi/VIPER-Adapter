//
//  MockHomeInteractor.swift
//  TYCaseTests
//
//  Created by Bahadir on 20.05.2022.
//

import Foundation
@testable import TYCase

final class MockHomeInteractor: HomeInteractorInterface {

    var invokedFetchWidgets = false
    var invokedFetchWidgetsCount = 0

    func fetchWidgets() {
        invokedFetchWidgets = true
        invokedFetchWidgetsCount += 1
    }

    var invokedFetchProducts = false
    var invokedFetchProductsCount = 0
    var invokedFetchProductsParameters: (url: String, index: Int, displayType: ScreenItemDisplayType, type: ScreenItemType, height: Int)?
    var invokedFetchProductsParametersList = [(url: String, index: Int, displayType: ScreenItemDisplayType, type: ScreenItemType, height: Int)]()

    func fetchProducts(url: String,
        index: Int,
        displayType: ScreenItemDisplayType,
        type: ScreenItemType,
        height: Int) {
        invokedFetchProducts = true
        invokedFetchProductsCount += 1
        invokedFetchProductsParameters = (url, index, displayType, type, height)
        invokedFetchProductsParametersList.append((url, index, displayType, type, height))
    }
}
