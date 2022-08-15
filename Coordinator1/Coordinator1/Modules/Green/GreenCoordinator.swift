//
//  GreenCoordinator.swift
//  Coordinator1
//
//  Created by user on 15.08.2022.
//

import UIKit

protocol GreenFlow {
    func coordinateToDetail(with title: String)
}

class GreenCoordinator: Coordinator, GreenFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let greenViewController = GreenViewController()
        greenViewController.coordinator = self
        
        navigationController?.pushViewController(greenViewController, animated: false)
    }
    
    func coordinateToDetail(with title: String) {
        let greenDetailCoordinator = GreenDetailCoordinator(
            navigationController: navigationController!,
            greenItemTitle: title
        )
        
        coordinate(to: greenDetailCoordinator)
    }
    
}
