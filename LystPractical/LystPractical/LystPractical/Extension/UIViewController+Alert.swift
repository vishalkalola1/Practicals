//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func hideAlert(completion:(() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
}
