//
//  FlowController.swift
//  CoordinatorPattern
//
//  Created by Улько Артем Викторович on 11.01.2024.
//

protocol RegistrationFlowController {

	associatedtype T
	var completionHandler: ((T) -> ())? { get set }
}
