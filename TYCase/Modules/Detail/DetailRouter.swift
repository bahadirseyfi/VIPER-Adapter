//
//  DetailRouter.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import Foundation
import UIKit

final class DetailRouter {
    
    static func build(with product: ProductElement) -> DetailViewController {
        let storyboard = UIStoryboard(name: Constants.System.Storyboard.detail, bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: Constants.System.Controller.detailViewController) as? DetailViewController else { fatalError("Error: DetailViewController build!") }
        
        let interactor = DetailInteractor(product: product)
        let presenter = DetailPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}
