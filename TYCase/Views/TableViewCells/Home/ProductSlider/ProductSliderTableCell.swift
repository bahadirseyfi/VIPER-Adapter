import UIKit

final class ProductSliderTableCell: UITableViewCell, TableViewCell {

    @IBOutlet private weak var productCollectionView: UICollectionView!
    
    var displayCount: Int = 4
    
    private var numberOfItemsInSection: Int = 0
    
    private var products: [ProductElement]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(cellType: ProductSliderCollectionCell.self)
        productCollectionView.backgroundColor = .inactive
    }
    
    func setData(data: Any?) {
        guard let products = data as? Products else { return }
        self.products = products
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProductSliderTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.frame.size.width - 20) / 5
        return CGSize(width: width, height: 250)
    }
}

// MARK: - UICollectionViewDataSource
extension ProductSliderTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.System.Controller.productSliderCollectionCell,
                                                                   for: indexPath) as? ProductSliderCollectionCell else {
            fatalError("ProductSliderCollectionCell")
        }
        
        if let product = products?[indexPath.item] {
            cell.setCell(product: product)
        }
        return cell
    }
}
