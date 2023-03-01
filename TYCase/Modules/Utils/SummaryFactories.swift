//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

enum ScreenItemDisplayType: String {
    case single = "SINGLE"
    case listing = "LISTING"
    case carousel = "CAROUSEL"
    case slider = "SLIDER"
    case unknown
}

enum ScreenItemType: String {
    case banner = "BANNER"
    case product = "PRODUCT"
}

struct ScreenItem {
    var displayType: ScreenItemDisplayType
    var type: ScreenItemType
    var order: Int
    var isEmpty: Bool
    var height: Int
    var products: Products?
    var bannerContent: [BannerContent]?
    var displayCount: Int?
}

struct ScreenResponse {
    var items: [ScreenItem]
}

final class SummaryTableViewFactory: TableViewModelFactory {
    var response: ScreenResponse?

    init(response: ScreenResponse?) {
        guard let response = response else {
            self.response = nil
            return
        }
        let items = response.items.sorted { item1, item2 in
            return item1.order < item2.order
        }
        self.response = ScreenResponse(items: items)
    }

    func create() -> TableViewModel {
        return TableViewModel(sections: [SummarySectionFactory(response: response).create()])
    }
}

final class SummarySectionFactory: SectionFactory {
    var response: ScreenResponse?

    init(response: ScreenResponse?) {
        self.response = response
    }

    func create() -> Section {
        guard let response = response else {
            return Section(cells: [])
        }

        let cells = response.items.compactMap { item -> Cell in
            if item.isEmpty {
                return SingleBannerCellFactory()
                    .create(data: item.products, height: item.height, displayCount: item.displayCount)
            }
            
            return getFactory(displayType: item.displayType, type: item.type)
                .create(data: item.bannerContent ?? item.products, height: item.height, displayCount: item.displayCount)
        }
        
        return Section(cells: cells)
    }

    func getFactory(displayType: ScreenItemDisplayType, type: ScreenItemType) -> CellFactory {
        switch type {
        case .banner:
            switch displayType {
            case .single:
                return SingleBannerCellFactory()
            case .listing:
                return BannerSliderCellFactory()
            case .carousel:
                return CarouselBannerCellFactory()
            case .slider:
                return BannerSliderCellFactory()
            case .unknown:
                //unknown
                return CarouselBannerCellFactory()
            }
            
        case .product:
            switch displayType {
            case .single:
                //unknown
                return CarouselBannerCellFactory()
            case .listing:
                return ProductListingCellFactory()
            case .carousel:
                //unknown
                return CarouselBannerCellFactory()
            case .slider:
                //unknown
                return CarouselBannerCellFactory()
            case .unknown:
                return CarouselBannerCellFactory()
            }
        }
    }
}

// MARK: -  CELL
final class SingleBannerCellFactory: CellFactory {
    func create(data: Any?, height: Int?, displayCount: Int?) -> Cell {
        return Cell(type: SingleBannerCell.self,
                    height: CGFloat(height ?? 0),
                    data: data)
    }
}

final class ProductSliderCellFactory: CellFactory {
    func create(data: Any?, height: Int?, displayCount: Int?) -> Cell {
        return Cell(type: ProductSliderTableCell.self,
                    height: CGFloat(height ?? 0),
                    data: data)
    }
}

final class BannerSliderCellFactory: CellFactory {
    func create(data: Any?, height: Int?, displayCount: Int?) -> Cell {
        return Cell(type: BannerSliderTableCell.self,
                    height: CGFloat(height ?? 0),
                    data: data,
                    displayCount: displayCount)
    }
}

final class ProductListingCellFactory: CellFactory {
    func create(data: Any?, height: Int?, displayCount: Int?) -> Cell {
        guard let data = data as? Products else {
            return Cell(type: ProductListingTableCell.self,
                        height: 200,
                        data: data)
            
        }

        return Cell(type: ProductListingTableCell.self,
                    height: CGFloat((data.count * 170) + (data.count / 2 * 10)),
                    data: data)
    }
}

final class CarouselBannerCellFactory: CellFactory {
    func create(data: Any?, height: Int?, displayCount: Int?) -> Cell {
        return Cell(type: CarouselBannerTableCell.self,
                    height: CGFloat(height ?? 0),
                    data: data)
    }
}

