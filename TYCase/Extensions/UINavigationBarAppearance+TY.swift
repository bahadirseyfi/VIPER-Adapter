//
//  UINavigationBarAppearance+TY.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

@available(iOS 13.0, *)
extension UINavigationBarAppearance {
    
    static let tyDefault: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.backgroundColor = .white
        return appearance
    }()
}
