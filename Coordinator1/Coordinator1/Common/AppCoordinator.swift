//
//  AppCoordinator.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let whiteCoordinator = WhitetCoordinator(navigationController: navigationController)
        coordinate(to: whiteCoordinator)
    }
}
