//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit
import CoreAPI

final class HomeRouter {
    
    func build() -> HomeViewController {
        let storyboard = UIStoryboard(name: Constants.System.Storyboard.home, bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: Constants.System.Controller.homeViewController) as? HomeViewController else {
            fatalError("Error: HomeViewController build!")
        }
        
        let interactor = HomeInteractor(networkManager: NetworkManager())
        let presenter = HomePresenter(view: view, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}
