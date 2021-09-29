//
//  ArtistCoordinate.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import Foundation
import UIKit

protocol ChildCoordinate: AnyObject {
    func showDetails(_ viewModel: ArtistDetailsViewModel) -> Void
}

class ArtistCoordinator: Coordinator, ChildCoordinate {
    
    var navigationController: UINavigationController
    
    lazy var artistViewController: ArtistsViewController = {
        return ArtistsViewController.instantiate()
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        artistViewController.artistViewModel = ArtistViewModel(artistCoordinator: self, delegate: artistViewController)
        navigationController.viewControllers = [artistViewController]
    }
    
    func showDetails(_ viewModel: ArtistDetailsViewModel) -> Void {
        let artistDetailsViewController = ArtistDetailsViewController.instantiate()
        artistDetailsViewController.artistDetails = viewModel
        self.navigationController.pushViewController(artistDetailsViewController, animated: true)
    }
}
