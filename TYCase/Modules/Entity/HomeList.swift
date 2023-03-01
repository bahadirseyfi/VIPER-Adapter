//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import Foundation

// MARK: - HomeList
struct HomeList: Codable {
    let widgets: [Widget]?
    let pagination: Pagination?
}

// MARK: - Pagination
struct Pagination: Codable {
    let currentPage, pageSize, totalCount: Int?
}

// MARK: - Widget
struct Widget: Codable {
    let bannerContents: [BannerContent]?
    let displayType, eventKey: String?
    let id: Int?
    let type: String?
    let displayCount: Int?
    let displayOptions: DisplayOptions?
    let startDate, endDate: String?
    let marketing: WidgetMarketing?
    let width, height: Int?
    let refreshRequired: Bool?
    let widgetNavigation: Navigation?
    let title, serviceURL: String?
    let fullServiceURL, fullServiceURLWithPage: String?

    enum CodingKeys: String, CodingKey {
        case bannerContents, displayType, eventKey, id, type, displayCount, displayOptions, startDate, endDate, marketing, width, height, refreshRequired, widgetNavigation, title
        case serviceURL = "serviceUrl"
        case fullServiceURL = "fullServiceUrl"
        case fullServiceURLWithPage = "fullServiceUrlWithPage"
    }
}

// MARK: - BannerContent
struct BannerContent: Codable {
    let bannerEventKey: String?
    let displayOrder: Int?
    let imageURL: String?
    let title: String?
    let navigation: Navigation?
    let subtitle: String?

    enum CodingKeys: String, CodingKey {
        case bannerEventKey, displayOrder
        case imageURL = "imageUrl"
        case title, navigation, subtitle
    }
}

// MARK: - Navigation
struct Navigation: Codable {
    let deeplink: String?
    let id: Int?
    let landingTitle: String?
    let navigationType: NavigationType?
    let title: String?
}

enum NavigationType: String, Codable {
    case deeplink = "DEEPLINK"
}

// MARK: - DisplayOptions
struct DisplayOptions: Codable {
    let showProductPrice, showProductFavoredButton, showClearButton, showCountdown: Bool?
    let showCountOnTitle: Bool?
    let paddingTopBottom, paddingRightLeft: Int?
}

// MARK: - WidgetMarketing
struct WidgetMarketing: Codable {
    let order: Int?
}

