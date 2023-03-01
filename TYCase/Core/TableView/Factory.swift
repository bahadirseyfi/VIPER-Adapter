//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

protocol CellFactory {
    func create(data: Any?, height: Int?, displayCount: Int?) -> Cell
}

protocol SectionFactory {
    func create() -> Section
}

protocol TableViewModelFactory {
    func create() -> TableViewModel
}

