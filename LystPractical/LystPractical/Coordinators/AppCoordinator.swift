//
//  AppCoordinator.swift
//  LystPractical
//
//  Created by Vishal on 27/07/21.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let breadSearchCoordinator = BreedSearchCoordinator(navigationController: navigationController)
        breadSearchCoordinator.start()
    }
}
