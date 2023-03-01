//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

protocol HomePresenterInterface {
    var productDidTapped: ((ProductElement) -> Void)? { get set }
    
    func setupAdapter(tableView: UITableView?)
    func onLoad()
}

final class HomePresenter {
    
    weak var view: HomeViewInterface?
    private let interactor: HomeInteractorInterface
    
    // MARK: - Fields
    private var adapter: TableViewAdapter?
    private var tableViewFactory: SummaryTableViewFactory?
    var productDidTapped: ((ProductElement) -> Void)?
    
    var items: [ScreenItem] = []
    
    init(view: HomeViewInterface, interactor: HomeInteractorInterface) {
        self.view = view
        self.interactor = interactor
    }
    
    private func getWidgets() {
        interactor.fetchWidgets()
    }
}

// MARK: - HomePresenterInterface
extension HomePresenter: HomePresenterInterface {
    
    func onLoad() {
        view?.registerCells()
        view?.prepareNavigationBarUI()
        view?.setTitle(Constants.Text.homeTitle)
        interactor.fetchWidgets()
    }
    
    func setupAdapter(tableView: UITableView?) {
        adapter = TableViewAdapter(factory: SummaryTableViewFactory(response: nil), view: view as? UIViewController)
        tableView?.setAdapter(adapter: adapter!)
    }
    
    func didReceive(items: [ScreenItem]) {
        let myList: ScreenResponse = ScreenResponse(items: items)
        tableViewFactory = SummaryTableViewFactory(response: myList)
        adapter?.reload(factory: tableViewFactory!)
        adapter?.cellForRowAt = { [weak self] cell in
            if let cell = cell as? ProductListingTableCell {
                cell.delegate = self
            }
        }
    }
}

// MARK: - HomeInteractorOutput
extension HomePresenter: HomeInteractorOutput {
    func handleWidgetResult(_ result: HomeListResult) {
        switch result {
        case .success(let response):
            response.widgets?.enumerated().forEach({ index, widget in
                let displayType = ScreenItemDisplayType(rawValue: widget.displayType ?? "") ?? .unknown
                let type = ScreenItemType(rawValue: widget.type ?? "") ?? .banner
                if !(widget.fullServiceURL?.isEmpty ?? true) {
                    guard let fullUrl = widget.fullServiceURL else { return }
                    self.interactor.fetchProducts(url: fullUrl,
                                                   index: index,
                                                   displayType: displayType,
                                                   type: type,
                                                   height: widget.height ?? 0)

                } else {
                        let screenItem = ScreenItem(displayType: displayType, type: type,
                                                    order: index,
                                                    isEmpty: false,
                                                    height: widget.height ?? 0,
                                                    bannerContent: widget.bannerContents,
                                                    displayCount: widget.displayCount)
                    self.items.append(screenItem)
                    didReceive(items: self.items)
                }
            })
        case .failure(let error):
            print("ERROR fetch Products: ", error.localizedDescription)
        }
    }
    
    func handleProductResult(_ result: ItemWidgetResult, url: String, index: Int, displayType: ScreenItemDisplayType, type: ScreenItemType, height: Int) {
        switch result {
        case .success(let response):
            let screenItem = ScreenItem(displayType: displayType, type: type,
                                        order: index,
                                        isEmpty: false,
                                        height: height,
                                        products: response)
            self.items.append(screenItem)
            didReceive(items: self.items )
        case .failure(let error):
            print("ERROR service products : ", error.localizedDescription)
        }
    }
}

extension HomePresenter: ProductListingTableCellDelegate {
    func cellDidTapped(_ product: ProductElement) {
        productDidTapped?(product)
    }
}
