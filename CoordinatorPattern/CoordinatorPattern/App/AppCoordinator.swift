//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Улько Артем Викторович on 11.01.2024.
//

import UIKit

class AppCoordinator: Coordinator {

	var navigationController: UINavigationController
	var flowCompletion: (() -> ())?

	private var childCoordinator: [Coordinator] = []

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let isAuth = false

		if isAuth {
			showMainFlow()
		} else {
			showRegistrationFlow()
		}
	}

	private func showRegistrationFlow() {
		let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(
			navigationController: navigationController
		)
		childCoordinator.append(registrationCoordinator)
		registrationCoordinator.flowCompletion = { [weak self, weak registrationCoordinator] in
			guard let self = self else { return }
			self.showMainFlow()
			self.childCoordinator = self.childCoordinator.filter { $0 !== registrationCoordinator }
		}
		registrationCoordinator.start()
	}

	private func showMainFlow() {
		let vc = UIViewController()
		vc.view.backgroundColor = .cyan
		navigationController.viewControllers = [vc]
	}
}
