//
//  BreedDetailsCoordinator.swift
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

class BreedDetailsCoordinator: Coordinator {

    var navigationController: UINavigationController
    private var model: BreedModel
    
    init(navigationController: UINavigationController, model: BreedModel) {
        self.navigationController = navigationController
        self.model = model
    }
    
    func start() {
        let catDetailsViewController = CatDetailsViewController.instantiate()
        catDetailsViewController.viewModel = BreedDetailsViewModel(coordinator: self, breed: model)
        navigationController.pushViewController(catDetailsViewController, animated: true)
    }
}
