//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import CoreAPI
import Foundation

protocol HomeInteractorInterface {
    func fetchWidgets()
    func fetchProducts(url: String,
                     index: Int,
                     displayType: ScreenItemDisplayType,
                     type: ScreenItemType,
                     height: Int)
}

protocol HomeInteractorOutput: AnyObject {
    func didReceive(items: [ScreenItem])
    func handleWidgetResult(_ result: HomeListResult)
    func handleProductResult(_ result: ItemWidgetResult,
                             url: String,
                             index: Int,
                             displayType: ScreenItemDisplayType,
                             type: ScreenItemType,
                             height: Int)
}

typealias HomeListResult = Result<HomeList, APIClientError>
typealias ItemWidgetResult = Result<Products, APIClientError>

final class HomeInteractor {
    
    private var networkManager: NetworkManager<EndpointItem>?    
    weak var output: HomeInteractorOutput?
        
    init(networkManager: NetworkManager<EndpointItem>) {
        self.networkManager = networkManager
    }
}

// MARK: - HomeInteractorInterface
extension HomeInteractor: HomeInteractorInterface {
    func fetchWidgets() {
        networkManager?.request(endpoint: .homeList, type: HomeList.self, completion: { [weak self] (result) in
            self?.output?.handleWidgetResult(result)
        })
    }
    
    func fetchProducts(url: String,
                     index: Int,
                     displayType: ScreenItemDisplayType,
                     type: ScreenItemType,
                     height: Int) {
        
        networkManager?.request(endpoint: .widgetElement(url: url), type: Products.self) { [weak self] (result) in
            self?.output?.handleProductResult(result,
                                              url: url,
                                              index: index,
                                              displayType: displayType,
                                              type: type,
                                              height: height)
        }
    }
}
