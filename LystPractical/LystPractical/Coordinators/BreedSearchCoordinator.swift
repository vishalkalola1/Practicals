//
//  BreedSearchCoordinator.swift
//  LystPractical
//
//  Created by Vishal on 27/07/21.
//

import UIKit

protocol BreedSearchCoordinatorType: Coordinator {
    func navigateToBreedDetailsCoordinator(_ breed: BreedModel)
}

class BreedSearchCoordinator: BreedSearchCoordinatorType {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let breedSearchViewController = BreedSearchViewController.instantiate()
        breedSearchViewController.viewModel = BreedSearchViewModel(coordinator: self)
        navigationController.pushViewController(breedSearchViewController, animated: true)
    }
    
    func navigateToBreedDetailsCoordinator(_ breed: BreedModel) {
        let breedDetailsCoordinator = BreedDetailsCoordinator(navigationController: navigationController, model: breed)
        breedDetailsCoordinator.start()
    }
}
