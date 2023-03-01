//
//  String+Extension.swift
//  TYCase
//
//  Created by Getir on 18.05.2022.
//

import UIKit

extension String {
    static func tyTitleFont(_ boldString: String, normalString: String, size: CGFloat) -> NSMutableAttributedString {
        let attributsBold = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: size, weight: .bold)]
        let attributsNormal = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: size, weight: .regular)]
        
        let boldStringPart = NSMutableAttributedString(string: boldString, attributes:attributsBold)
        let attributedString = NSMutableAttributedString(string: normalString, attributes:attributsNormal)
        let attributedSpace = NSMutableAttributedString(string: " ", attributes:attributsNormal)
        
        boldStringPart.append(attributedSpace)
        boldStringPart.append(attributedString)
        
        return boldStringPart
    }
    
    func toTLCurrency(amount: Double) -> String {
        let result = "\(amount) TL"
        return result
    }
}
