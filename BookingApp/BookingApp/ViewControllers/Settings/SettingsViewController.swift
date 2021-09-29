//
//  SettingsViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

///Function Same As HomeViewController
class SettingViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = view.frame
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60)
        self.view.addSubview(label)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        first = (self.tabBarController as? CustomTabViewController)?.bookingViewModel.first
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.label.frame = self.view.frame
        }
        
    }
    
    private var first : Booking? {
        willSet {
            self.view.backgroundColor = newValue?.status.color ?? .orange
            switch self.view.backgroundColor {
            case UIColor.orange:
                self.label.text = "😏"
                break;
            case UIColor.green:
                self.label.text = "😀"
                break;
            case UIColor.red:
                self.label.text = "😡"
                break;
            default:
                self.label.text = "🤬"
            }
        }
    }
}
