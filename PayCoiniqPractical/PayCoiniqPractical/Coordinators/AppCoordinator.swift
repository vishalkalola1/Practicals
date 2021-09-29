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
    lazy var inputViewController: InputViewController = {
        return InputViewController.instantiate()
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        inputViewController.viewModel = InputViewModel(coordinator: self)
        self.navigationController.pushViewController(inputViewController, animated: true)
    }
    
    func popUPViewController(_ text: String) {
        let popupViewController = PopupViewController.instantiate()
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.delegate = inputViewController
        popupViewController.text = text
        inputViewController.present(popupViewController, animated: false, completion: nil)
    }
}
