//
//  BlueCoordinator.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit

protocol BlueFlow: AnyObject {
    func coordinateToDetail()
}

class BlueCoordinator: Coordinator, BlueFlow {

    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let blueViewController = BlueViewController()
        blueViewController.coordinator = self
        navigationController?.pushViewController(blueViewController, animated: false)
    }

    func coordinateToDetail() {
        let blueDetailCoordinator = BlueDetailCoordinator(navigationController: navigationController!)
        coordinate(to: blueDetailCoordinator)
    }
}

