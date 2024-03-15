//
//  ModuleFactory.swift
//  CoordinatorPattern
//
//  Created by Улько Артем Викторович on 11.01.2024.
//

class ModuleFactory {

	func createEnterPhoneModule() -> EnterPhoneViewContoller {
		EnterPhoneViewContoller()
	}

	func createConformPhoneModule() -> ConformPhoneViewContoller {
		ConformPhoneViewContoller()
	}

	func createEnterPasswordModule() -> EnterPasswordViewContoller {
		EnterPasswordViewContoller()
	}

	func createEnterNameModule() -> EnterNameViewContoller {
		EnterNameViewContoller()
	}

	func createEnterBirthdayModule() -> EnterBirthdayViewContoller {
		EnterBirthdayViewContoller()
	}
}
