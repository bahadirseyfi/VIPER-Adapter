//
//  DetailInteractor.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import Foundation

protocol DetailInteractorInterface {
    func fetchProduct()
}

protocol DetailInteractorOutput: AnyObject {
    func handleProductResult(_ product: ProductElement)
}

final class DetailInteractor {
    weak var output: DetailInteractorOutput?
    
    private var product: ProductElement
    
    init(product: ProductElement) {
        self.product = product
    }
}

extension DetailInteractor: DetailInteractorInterface {
    func fetchProduct() {
        self.output?.handleProductResult(product)
    }
}
