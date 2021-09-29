//
//  TabBarCoordinator.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import UIKit

class TabBarCoordinator : Coordinator {
    var childCoordinator =  [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    
}
