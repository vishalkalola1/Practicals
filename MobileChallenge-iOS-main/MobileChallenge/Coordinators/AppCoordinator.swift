//
//  MainCoordinator.swift
//  SwapCardTest
//
//  Created by Vishal on 6/10/21.
//

import Foundation
import UIKit


class AppCoordinator: TabCoordinator {

    var navigationController: UINavigationController
    var artistViewControllerNav: NavigationViewControllerTabOne
    var favoriteViewControllerNav: NavigationViewControllerTabTwo
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.artistViewControllerNav = NavigationViewControllerTabOne.instantiate()
        self.favoriteViewControllerNav = NavigationViewControllerTabTwo.instantiate()
    }
    
    func start() {
        let tabViewController = TabViewController.instantiate()
        
        let artistCoordinator = ArtistCoordinator(navigationController: artistViewControllerNav)
        artistCoordinator.start()
        
        let favoriteCoordinator = FavoriteCoordinator(navigationController: favoriteViewControllerNav, artistCoordinator: artistCoordinator)
        favoriteCoordinator.start()
        
        tabViewController.viewControllers = [artistViewControllerNav, favoriteViewControllerNav]
        
        navigationController.viewControllers = [tabViewController]
    }
}
