//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Улько Артем Викторович on 11.01.2024.
//

import UIKit

protocol Coordinator: AnyObject {

	var navigationController: UINavigationController { get set }
	var flowCompletion: (() -> ())? { get set }

	func start()
}
