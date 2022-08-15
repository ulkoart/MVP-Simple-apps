//
//  BlueDetailCoordinator.swift
//  Coordinator1
//
//  Created by user on 15.08.2022.
//

import UIKit

protocol BlueDetailFlow {
    func dismissDetail()
}

class BlueDetailCoordinator: Coordinator, BlueDetailFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let blueDetailViewController = BlueDetailViewController()
        blueDetailViewController.coordinator = self
        navigationController.present(blueDetailViewController, animated: true, completion: nil)
    }

    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
