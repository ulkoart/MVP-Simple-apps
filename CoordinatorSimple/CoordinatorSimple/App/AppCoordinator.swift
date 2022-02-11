//
//  AppCoordinator.swift
//  CoordinatorSimple
//
//  Created by user on 11.02.2022.
//

import UIKit


protocol Coordinator: AnyObject {
    var childCoordinators : [Coordinator] { get set }
    var isCompleted: (() -> ())? { get set }
    func start()
}

extension Coordinator {

    func store(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isCompleted: (() -> ())?
    

    let window : UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        let mainViewCoordinator = MainViewCoordinator(navigationController: navigationController)
        mainViewCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        mainViewCoordinator.isCompleted = { [weak self] in
            self?.free(coordinator: mainViewCoordinator)
        }
    }
}
