//
//  AppCoordinator.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
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
        let login = LoginViewController.instantiate()
        login.loginViewModel = LoginViewModel(appCoordinator: self)
        self.navigationController.pushViewController(login, animated: true)
    }
    
    func VideoPlayer(playerViewModel: PlayerViewModel){
        let playerViewController = PlayerViewController.instantiate()
        playerViewController.playerViewModel = playerViewModel
        self.navigationController.pushViewController(playerViewController, animated: true)
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
}
