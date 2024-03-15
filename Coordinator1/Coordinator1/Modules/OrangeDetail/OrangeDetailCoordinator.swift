//
//  OrangeDetailCoordinator.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit

protocol OrangeDetailFlow {
    func dismissDetail()
}

class OrangeDetailCoordinator: Coordinator, OrangeDetailFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let orangeDetailViewController = OrangeDetailViewController()
        orangeDetailViewController.coordinator = self
        navigationController.present(orangeDetailViewController, animated: true, completion: nil)
    }

    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
