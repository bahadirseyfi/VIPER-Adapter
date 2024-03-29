//
//  TYTabBarController.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit
import CoreAPI

@available(iOS 13.0, *)
final class TYTabBarController: UITabBarController {
    
    // MARK: View controllers
    private let homePage = HomeRouter().build()
    
    // MARK: Field
    private let tyNavigationController: TYNavigationController
    
    init() {
        self.tyNavigationController = TYNavigationController(rootViewController: homePage)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        delegate = self
        
        tyNavigationController.delegate = self
        tyNavigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: Constants.Image.barImageName),
            tag: 0
        )
        
        let navigationControllers = [
            tyNavigationController,
        ]
        
        navigationControllers.forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        setViewControllers(navigationControllers, animated: false)
        
        tabBar.barTintColor = .white
        tabBar.tintColor = .systemOrange
        tabBar.backgroundColor = .clear
    }
    
    func tabBarControllerSupportedInterfaceOrientations(
        _ tabBarController: UITabBarController
    ) -> UIInterfaceOrientationMask {
        .portrait
    }
    
    func tabBarControllerPreferredInterfaceOrientationForPresentation(
        _ tabBarController: UITabBarController
    ) -> UIInterfaceOrientation {
        .portrait
    }
}

// MARK: - UITabBarControllerDelegate
extension TYTabBarController: UITabBarControllerDelegate {
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        if selectedViewController === viewController,
           viewController === tyNavigationController {
            if tyNavigationController.viewControllers.count > 1 {
                tyNavigationController.popViewController(animated: true)
            } else {
                
            }
        }
        return true
    }
}

// MARK: - UINavigationControllerDelegate
extension TYTabBarController: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        viewController.extendedLayoutIncludesOpaqueBars = true
    }
}
