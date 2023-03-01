import UIKit

final class CarouselBannerTableCell: UITableViewCell, TableViewCell {

    @IBOutlet private weak var imageSliderView: ImageSliderView!
    
    private var product: [BannerContent]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(data: Any?) {
        guard let product = data as? [BannerContent] else { return }
     
        let productUrls = product.compactMap { prod in
            prod.imageURL
        }
        
        let imageSliderPresenter = ImageSliderViewPresenter(imageUrls: productUrls,
                                                            loopingEnabled: true,
                                                            view: imageSliderView)
        imageSliderView.presenter = imageSliderPresenter
        
        imageSliderView.layer.cornerRadius = 10
    }
}
