//
//  CamerasCoordinator.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

class CameraCoordinator: Coordinator {

    var navigationController: UINavigationController
    private var model: CameraModel
    
    init(navigationController: UINavigationController, model: CameraModel) {
        self.navigationController = navigationController
        self.model = model
    }
    
    func start() {
        let cameraViewController = CameraDetailsViewController.instantiate()
        cameraViewController.viewModel = CameraViewModel(cameraCoordinator: self, cameraModel: model)
        navigationController.pushViewController(cameraViewController, animated: true)
    }
}
