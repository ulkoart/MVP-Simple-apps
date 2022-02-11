//
//  MainViewCoordinator.swift
//  CoordinatorSimple
//
//  Created by user on 11.02.2022.
//

import UIKit

class MainViewCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isCompleted: (() -> ())?
    var navigationController: UINavigationController?
    
    init(navigationController :UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: false)
    }
}
