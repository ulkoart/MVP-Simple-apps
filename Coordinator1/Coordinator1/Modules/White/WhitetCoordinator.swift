//
//  StartCoordinator.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit

protocol WhiteFlow: AnyObject {
    func coordinateToTabBar()
}

class WhitetCoordinator: Coordinator, WhiteFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let whiteViewController = WhiteController()
        whiteViewController.coordinator = self
        navigationController.pushViewController(whiteViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }

    deinit {
        print("\(Self.self)")
    }
}
