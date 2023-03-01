//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit
import SDWebImage

final class SingleBannerCell: UITableViewCell, TableViewCell {
    
    @IBOutlet private weak var bannerImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var product: Products?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(data: Any?) {
        guard let data = data as? [BannerContent] else { return }
        titleLabel.text = data.first?.title
        if let url = data.first?.imageURL {
            bannerImage.sd_setImage(with: URL(string: url))
        }
    }
}
