//
//  NibView.swift
//  TYCase
//
//  Created by Bahadir on 19.05.2022.
//

import UIKit

class NibView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
    }

    func fromNib() {
        if let contentView = Bundle.main.loadNibNamed(String(describing: type(of: self)),
                                                      owner: self,
                                                      options: nil)?.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
        }
    }
}
