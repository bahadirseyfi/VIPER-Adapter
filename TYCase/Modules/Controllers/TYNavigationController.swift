//
//  TYNavigationController.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class TYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // allow swipe back gesture even if navigation bar is hidden
        interactivePopGestureRecognizer?.delegate = nil

        navigationBar.prefersLargeTitles = false
        navigationBar.barTintColor = .white
        navigationBar.tintColor = .systemOrange
        if #available(iOS 13.0, *) {
            navigationBar.standardAppearance = .tyDefault
            navigationBar.scrollEdgeAppearance = .tyDefault
        } else {
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBar.isTranslucent = false
        }
    }
}
