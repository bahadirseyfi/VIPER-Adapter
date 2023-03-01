//
//  SlideView.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

final class SlideView: UIView {

    @IBOutlet weak var imageView: UIImageView!

    func configure(image: UIImage? = nil) {
        
        guard let image = image else {
            imageView.image = UIImage(named: "BanerImage")
            return
        }
        imageView.image = image
        
    }
}
