//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import Foundation

public extension NSObject {
    @objc class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
