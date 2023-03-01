//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

extension UITableView {
    func setAdapter(adapter: TableViewAdapterProtocol){
        adapter.tableView = self
        self.delegate = adapter
        self.dataSource = adapter
        self.reloadData()
    }

    func dequeu<T:UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell =  self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Not defined")
        }
        return cell
    }

    func register(cell: UITableViewCell.Type, bundle: Bundle = Bundle.main) {
        let nib = UINib(nibName: cell.className, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: cell.className)
    }

    func register(cells: [UITableViewCell.Type], bundle: Bundle = Bundle.main) {
        cells.forEach { cell in
            register(cell: cell, bundle: bundle)
        }
    }
}
