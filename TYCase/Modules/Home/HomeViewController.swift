//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

protocol HomeViewInterface: AnyObject {
    func registerCells()
    func prepareNavigationBarUI()
    func setTitle(_ title: String)
}

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupAdapter(tableView: tableView)
        presenter.onLoad()
        setClosures()
    }
    
    private func setClosures() {
        presenter.productDidTapped = { [weak self] product in
            let vc = DetailRouter.build(with: product)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: HomeViewInterface {
    func setTitle(_ title: String) {
        navigationItem.title = title
    }
    
    func registerCells() {
        tableView?.register(cell: SingleBannerCell.self)
        tableView?.register(cell: ProductSliderTableCell.self)
        tableView?.register(cell: BannerSliderTableCell.self)
        tableView?.register(cell: ProductListingTableCell.self)
        tableView?.register(cell: CarouselBannerTableCell.self)
    }
    
    func prepareNavigationBarUI() {
        navigationItem.standardAppearance = .tyDefault
    }
}
