//
//  CustomTabViewController.swift
//  BookingApp
//
//  Created by Vishal on 5/17/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit

///Create Custom TabViewController To Call Api and manage ViewContollers
class CustomTabViewController: UITabBarController {
    
    ///Initialize the BookingsViewModel
    let bookingViewModel = BookingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [UIViewController.home, UIViewController.splitview, UIViewController.settings]
    }
}
