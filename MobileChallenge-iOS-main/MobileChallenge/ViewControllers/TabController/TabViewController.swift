//
//  TabViewController.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import UIKit

extension UIViewController: Storyboard {
    
}

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
   
    }
}
