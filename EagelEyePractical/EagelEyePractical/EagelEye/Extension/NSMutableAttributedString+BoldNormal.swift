//
//  NSMutableAttributedString+BoldNormal.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/18/21.
//

import UIKit

extension NSMutableAttributedString {
    
    func bold(_ value: String, fontSize: CGFloat = 15.0) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: fontSize)
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value: String, fontSize: CGFloat = 15.0) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
