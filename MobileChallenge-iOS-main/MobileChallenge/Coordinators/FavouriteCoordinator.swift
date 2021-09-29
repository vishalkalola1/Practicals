//
//  FavoriteCoordinator.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import Foundation
import UIKit


class FavoriteCoordinator: Coordinator, ChildCoordinate {
    
    var navigationController: UINavigationController
    lazy var favoriteViewController: FavoriteViewController = {
        return FavoriteViewController.instantiate()
    }()
    var artistCoordinator: ArtistCoordinator
    
    init(navigationController: UINavigationController, artistCoordinator: ArtistCoordinator) {
        self.navigationController = navigationController
        self.artistCoordinator = artistCoordinator
    }
    
    func start() {
        favoriteViewController.favoriteViewModel = FavoriteViewModel(favoriteCoordinator: self, delegate: artistCoordinator.artistViewController)
        navigationController.viewControllers = [favoriteViewController]
    }
    
    func showDetails(_ viewModel: ArtistDetailsViewModel) -> Void {
        let artistDetailsViewController = ArtistDetailsViewController.instantiate()
        artistDetailsViewController.artistDetails = viewModel
        self.navigationController.pushViewController(artistDetailsViewController, animated: true)
    }
}
