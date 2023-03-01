//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import Foundation

// MARK: - Product
typealias Products = [ProductElement]

struct ProductElement: Codable {
    let brandName: String
    let name: String
    let imageUrl: URL
    let newDiscountedPrice: Double
    let imageUrls: [String]?
    let isDirectCartAdditionAvailable: Bool?
    let hasScheduledDelivery: Bool?
    let freeCargo: Bool?
    let orderedPromotions: [Promotion]?
    let averageRating: Double?
    let ratingCount: Int?
    let discountedPriceInfo: String?
}

struct Promotion: Codable {
    let shortname: String
    let icon: URL?
}

struct PromotionList: Codable {
    let shortname: String?
    let icon: URL?
}
