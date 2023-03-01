//
//  MockDetailInteractor.swift
//  TYCaseTests
//
//  Created by Getir on 21.05.2022.
//

import Foundation
@testable import TYCase

final class MockDetailInteractor: DetailInteractorInterface {

    var invokedFetchProduct = false
    var invokedFetchProductCount = 0

    func fetchProduct() {
        invokedFetchProduct = true
        invokedFetchProductCount += 1
    }
}
