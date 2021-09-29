//
//  CustomSplitViewController.swift
//  BookingApp
//
//  Created by Vishal on 5/17/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit

///Create SplitView to Handle Master and DetailsView
class CustomSplitViewController: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredDisplayMode = .allVisible
        self.delegate = self
        self.viewControllers = [UIViewController.navigationWithBookingTable]
    }
}

extension CustomSplitViewController : UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
            return true
    }
    
}
