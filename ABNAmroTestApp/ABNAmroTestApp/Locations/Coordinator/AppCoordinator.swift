//
//  AppCoordinator.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/4/21.
//

import UIKit



class AppCoordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let locationViewController = LocationsViewController.instantiate()
        locationViewController.viewModel = LocationsViewModel(delegate: locationViewController, appCoordinator: self)
        self.navigationController.pushViewController(locationViewController, animated: true)
    }
    
    func navigateToAddLocation(playerViewModel: AddLocationViewModel){
        let addLocationViewController = AddLocationViewController.instantiate()
        addLocationViewController.viewModel = playerViewModel
        self.navigationController.pushViewController(addLocationViewController, animated: true)
    }
    
    func popToLocationsScreen() {
        self.navigationController.popViewController(animated: true)
    }
    
    func open(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Wikipedia app is not installed")
        }
    }
}
