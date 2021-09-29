//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

extension NSMutableAttributedString {
    
    func bold(_ value: String, fontSize: CGFloat = 18.0) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: fontSize)
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value: String, fontSize: CGFloat = 18.0) -> NSMutableAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        style.minimumLineHeight = 20
        style.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
            .paragraphStyle: style
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
