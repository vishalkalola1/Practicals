//
//  CamerasCoordinator.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

protocol CamerasCoordinatorType: Coordinator {
    func navigateToCameraCoordinate(_ camera: CameraModel)
    func pop()
}

class CamerasCoordinator: CamerasCoordinatorType {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let camerasViewController = CamerasViewController.instantiate()
        camerasViewController.viewModel = CamerasViewModel(coordinator: self)
        navigationController.pushViewController(camerasViewController, animated: true)
    }
    
    func navigateToCameraCoordinate(_ camera: CameraModel) {
        let cameraCoordinator = CameraCoordinator(navigationController: navigationController, model: camera)
        cameraCoordinator.start()
    }
    
    func pop(){
        navigationController.popViewController(animated: true)
    }
}
