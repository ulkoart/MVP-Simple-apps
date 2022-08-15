//
//  TabBarCoordinator.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit

class TabBarCoordinator: Coordinator {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let orangeNavigationController = UINavigationController()
        orangeNavigationController.tabBarItem = UITabBarItem(title: "Orange", image: UIImage(systemName: "star.fill"), tag: 0)
        let orangedCoordinator = OrangeCoordinator(navigationController: orangeNavigationController)
        
        let blueNavigationController = UINavigationController()
        blueNavigationController.tabBarItem = UITabBarItem(title: "Blue", image: UIImage(systemName: "moon.stars.fill"), tag: 1)
        let blueCoordinator = BlueCoordinator(navigationController: blueNavigationController)

        let greenNavigationController = UINavigationController()
        greenNavigationController.tabBarItem = UITabBarItem(title: "Green", image: UIImage(systemName: "staroflife.fill"), tag: 2)
        let greenCoordinator = GreenCoordinator(navigationController: greenNavigationController)

        tabBarController.viewControllers = [orangeNavigationController, blueNavigationController, greenNavigationController]

        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        coordinate(to: orangedCoordinator)
        coordinate(to: blueCoordinator)
        coordinate(to: greenCoordinator)
    }

}
