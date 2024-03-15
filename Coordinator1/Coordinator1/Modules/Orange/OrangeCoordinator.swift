//
//  OrangeCoordinator.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit

protocol OrangeFlow: AnyObject {
    func coordinateToDetail()
}

class OrangeCoordinator: Coordinator, OrangeFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let orangeViewController = OrangeViewController()
        orangeViewController.coordinator = self
        navigationController?.pushViewController(orangeViewController, animated: false)
    }

    func coordinateToDetail() {
        let orangeDetailCoordinator = OrangeDetailCoordinator(navigationController: navigationController!)
        coordinate(to: orangeDetailCoordinator)
    }
}
