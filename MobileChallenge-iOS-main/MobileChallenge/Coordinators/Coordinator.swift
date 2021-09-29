//
//  Coordinator.swift
//  SwapCardTest
//
//  Created by Vishal on 6/10/21.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}

protocol TabCoordinator: Coordinator {
    var artistViewControllerNav: NavigationViewControllerTabOne { get set }
    var favoriteViewControllerNav: NavigationViewControllerTabTwo { get set }
}
