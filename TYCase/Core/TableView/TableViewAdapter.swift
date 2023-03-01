//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

protocol TableViewAdapterProtocol: UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView? {get set}
}

final class TableViewAdapter: NSObject, TableViewAdapterProtocol {
    weak var tableView: UITableView?
    var model: TableViewModel
    var didSelect: ((IndexPath, Cell) -> Void)?
    var cellForRowAt: ((UITableViewCell?) -> Void)?
    var view: UIViewController?
    
    init(factory: TableViewModelFactory, view: UIViewController?) {
        self.model = factory.create()
        self.view = view
    }

    func reload(factory: TableViewModelFactory) {
        DispatchQueue.main.async {
            self.model = factory.create()
            self.tableView?.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCell(atIndexPath: indexPath)
        let realCell = cell.type.cellForRowAt(tableView: tableView, indexPath: indexPath)
        cellForRowAt?(realCell)
        if cell.data != nil {
            realCell.setData(data: cell.data)
            realCell.setUIController(view: view)
            realCell.setDisplayCount(cell.displayCount)
        }
        return realCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSection(atIndex: section).cells.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.model.sections.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = getCell(atIndexPath: indexPath)
        return cell.height
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getSection(atIndex: section).headerView?.view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return getSection(atIndex: section).headerView?.height ?? 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.model.sections[section].footerView?.view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.model.sections[section].footerView?.height ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = model.sections[indexPath.section].cells[indexPath.row]
        self.didSelect?(indexPath, cell)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

private extension TableViewAdapter {
    func getSection(atIndex index: Int) -> Section {
        guard self.model.sections.count > index else {
            fatalError("Section: Out of range \(index)")
        }

        return self.model.sections[index]
    }

    func getCell(atIndexPath indexpath: IndexPath) -> Cell {
        let section = getSection(atIndex: indexpath.section)
        guard section.cells.count > indexpath.row else {
            fatalError("Cell: Out of range indexpath \(indexpath)")
        }
        return section.cells[indexpath.row]
    }
}
