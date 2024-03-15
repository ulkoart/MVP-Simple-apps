//
//  RegistrationCoordinator.swift
//  CoordinatorPattern
//
//  Created by Улько Артем Викторович on 11.01.2024.
//

import UIKit

class RegistrationCoordinator: Coordinator {

	var navigationController: UINavigationController
	var flowCompletion: (() -> ())?

	private let moduleFactory = ModuleFactory()
	private var userData = UserData()

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	deinit {
		print("deinit - \(Self.self)")
	}

	func start() {
		showEnterPhoneModule()
	}

	private func showEnterPhoneModule() {
		let controller = moduleFactory.createEnterPhoneModule()
		controller.completionHandler = { [weak self] phoneNumber in
			self?.userData.phoneNumber = phoneNumber
			self?.showConformPhoneModule()
		}
		navigationController.pushViewController(controller, animated: true)
	}

	private func showConformPhoneModule() {
		let controller = moduleFactory.createConformPhoneModule()
		controller.completionHandler = { [weak self] isConform in
			if isConform {
				self?.showEnterPassword()
			} else {
				print("isConform - false")
			}
		}
		navigationController.pushViewController(controller, animated: true)
	}

	private func showEnterPassword() {
		let controller = moduleFactory.createEnterPasswordModule()
		controller.completionHandler = { [weak self] password in
			self?.userData.password = password
			self?.showEnterName()
		}
		navigationController.pushViewController(controller, animated: true)
	}

	private func showEnterName() {
		let controller = moduleFactory.createEnterNameModule()
		controller.completionHandler = { [weak self] name in
			self?.userData.name = name
			self?.showEnterBirthday()
		}
		navigationController.pushViewController(controller, animated: true)
	}

	private func showEnterBirthday() {
		let controller = moduleFactory.createEnterBirthdayModule()
		controller.completionHandler = { [weak self] birthday in
			self?.userData.birthday = birthday
			self?.flowCompletion?()
			// self?.flowCompletion = nil
		}
		navigationController.pushViewController(controller, animated: true)
	}
}
