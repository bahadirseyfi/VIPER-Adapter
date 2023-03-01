//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

protocol TableViewCell {
    static func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> Self
    func setData(data: Any?)
    func setUIController(view: UIViewController?)
    func setDisplayCount(_ displayCount: Int?)
}

extension TableViewCell where Self: UITableViewCell {
    static func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> Self {
        let cell: Self = tableView.dequeu(for: indexPath)
        return cell
    }
    func setData(data: Any?) { }
    func setDisplayCount(_ displayCount: Int?) { }
    func setUIController(view: UIViewController?) { }
}
 
struct Cell {
    var type: (UITableViewCell & TableViewCell).Type
    var height: CGFloat
    var data: Any?
    var displayCount: Int?
    
    init(type: (UITableViewCell & TableViewCell).Type, height: CGFloat, data: Any? = nil, displayCount: Int? = 0) {
        self.type = type
        self.height = height
        self.data = data
        self.displayCount = displayCount
    }
}

struct SectionView {
    var view: UIView
    var height: CGFloat
}

struct Section {
    var cells: [Cell]
    var headerView: SectionView?
    var footerView: SectionView?
}

struct TableViewModel {
    var sections: [Section]
}



