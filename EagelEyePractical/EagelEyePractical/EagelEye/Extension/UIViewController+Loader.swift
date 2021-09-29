//
//  UIViewController+Loader.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/18/21.
//

import UIKit

extension UIViewController {
    
    func showLoader() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let spinner = spinner()
        alert.view.addSubview(spinner)
        present(alert, animated: true, completion: nil)
    }
    
    private func spinner() -> UIActivityIndicatorView {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        return loadingIndicator
    }
    
    func hideLoader(completion:(() -> Void)?) {
        self.dismiss(animated: true, completion: completion)
    }
}
