//
//  DetailSliderViewCell.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class DetailSliderViewCell: UITableViewCell, TableViewCell {

    let imgUrls: [String] = [
        "https://cdn.dsmcdn.com/mnresize/600/900//ty343/product/media/images/20220228/13/59927738/316484580/3/3_org_zoom.jpg",
        "https://cdn.dsmcdn.com/mnresize/600/900//ty342/product/media/images/20220228/13/59927738/316484580/2/2_org_zoom.jpg",
        "https://cdn.dsmcdn.com/mnresize/600/900//ty343/product/media/images/20220228/13/59927738/316484580/4/4_org_zoom.jpg",
        "https://cdn.dsmcdn.com/mnresize/600/900//ty343/product/media/images/20220228/13/59927738/316484580/5/5_org_zoom.jpg",
        "https://cdn.dsmcdn.com/mnresize/600/900//ty342/product/media/images/20220228/13/59927738/316484580/6/6_org_zoom.jpg"
    ]
    
    @IBOutlet weak var imageSlider: ImageSliderView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let imageSliderPresenter = ImageSliderViewPresenter(imageUrls: imgUrls,
                                                            loopingEnabled: true,
                                                            view: imageSlider)
        imageSlider.presenter = imageSliderPresenter
    }
}
