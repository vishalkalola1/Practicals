//
//  AppCoordinator.swift
//
//  Created by Vishal on 7/4/21.
//

import UIKit

protocol CoordinatorType {
    var navigationController: UINavigationController { get set }
    func start()
    func navigateToFileManager(_ delegate: UIDocumentPickerDelegate)
}

final class AppCoordinator: CoordinatorType {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let memberProfileViewController = MemberProfileViewController.instantiate()
        memberProfileViewController.viewModel = MemberProfilesViewModel(coordinator: self)
        navigationController.pushViewController(memberProfileViewController, animated: true)
    }
    
    func navigateToFileManager(_ delegate: UIDocumentPickerDelegate) {
        let fileManagerCoordinator = FileManagerCoordinator(navigationController: navigationController)
        fileManagerCoordinator.start(delegate)
    }
}
