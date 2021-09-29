//
//  LoginCoordinator.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

protocol LoginCoordinatorType: Coordinator {
    func navigateToCameraCoordinate()
}

class LoginCoordinator: LoginCoordinatorType {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiate()
        loginViewController.viewModel = LoginViewModel(loginCoordinator: self)
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func navigateToCameraCoordinate(){
        let cameraCoordinator = CamerasCoordinator(navigationController: navigationController)
        cameraCoordinator.start()
    }
}
