//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import Foundation
import CoreAPI

extension EndpointItem {
    private enum Contant {
        static let widgetBaseURL = "https://browsingpublic.trendyol.com/mobile-zeus-zeus-service/"
        static let productBaseURL = "https://searchpublic.trendyol.com/mobile-zeus-zeussearch-service/"
    }
}

enum EndpointItem: Endpoint {
    case homeList
    case widgetElement(url: String)
    
    var method: HTTPMethod {
        switch self {
        case .homeList:
            return .get
        case .widgetElement:
            return .get
        }
    }

    var path: String {
        switch self {
        case .homeList:
            return "\(Contant.widgetBaseURL)widget/display/personalized"
        case .widgetElement:
            return "\(Contant.productBaseURL)search/homepage-products"
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .homeList:
            return ["Build": "217",
                     "Platform": "iphone",
                     "widgetPageName":"interview"]
            
        case .widgetElement:
            return [
                "Build": "217",
                "Platform": "iphone",
            ]
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .homeList:
            return ["widgetPageName": "interview",
                    "platform": "iphone"]
        case .widgetElement(let url):
            guard let url = URL(string: url) else { return ["":(Any).self] }
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            let queryItems = urlComponents?.queryItems
            guard let fullParameter = queryItems?.reduce([String:String](), { partialResult, item in
                var prevRes = partialResult
                prevRes[item.name] = item.value
                return prevRes
            }) else { return ["":(Any).self] }
            return fullParameter
        }
    }
}
