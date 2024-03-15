//
//  GreenDetailCoordinator.swift
//  Coordinator1
//
//  Created by user on 15.08.2022.
//

import UIKit

protocol GreenDetailFlow {
    func dismissDetail()
}

class GreenDetailCoordinator: Coordinator, GreenDetailFlow {
    let navigationController: UINavigationController
    let greenItemTitle: String
    
    init(navigationController: UINavigationController,
         greenItemTitle: String) {
        
        self.navigationController = navigationController
        self.greenItemTitle = greenItemTitle
    }
    
    func start() {
        let greenDetailViewController = GreenDetailViewController()
        greenDetailViewController.greenItemTitle = greenItemTitle
        greenDetailViewController.coordinator = self
        
        navigationController.present(greenDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
