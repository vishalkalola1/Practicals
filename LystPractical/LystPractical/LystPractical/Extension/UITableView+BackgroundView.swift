//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = createMessageLabel(message)
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    private func createMessageLabel(_ message: String) -> UILabel {
        let messageLabel = UILabel(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: self.bounds.size.width,
                                                 height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        messageLabel.sizeToFit()
        return messageLabel
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
