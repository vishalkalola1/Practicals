//
//  SceneDelegate.swift
//  LystPractical
//
//  Created by Vishal on 27/07/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private lazy var appCoordinator: AppCoordinator = {
        let navigation = UINavigationController.instantiate()
        return AppCoordinator(navigationController: navigation)
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        appCoordinator.start()
        window?.rootViewController = appCoordinator.navigationController
        window?.makeKeyAndVisible()
    }
}

