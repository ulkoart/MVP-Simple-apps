//
//  CoordinatorFactory.swift
//  CoordinatorPattern
//
//  Created by Улько Артем Викторович on 11.01.2024.
//

import UIKit

class CoordinatorFactory {

	func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
		AppCoordinator(navigationController: navigationController)
	}

	func createRegistrationCoordinator(navigationController: UINavigationController) -> RegistrationCoordinator {
		RegistrationCoordinator(navigationController: navigationController)
	}
}
