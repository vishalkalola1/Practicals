//
//  ViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = view.frame
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60)
        self.view.addSubview(label)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.label.frame = self.view.frame
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ///Get the First Oject by accessing the viewModels and parent class.
        first = (self.tabBarController as? CustomTabViewController)?.bookingViewModel.first
    }
    
    ///Set background view color depends on first records
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

