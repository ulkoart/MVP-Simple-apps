//
//  DIContainer.swift
//  CoordinatorSimple
//
//  Created by Artem Ulko on 24.05.2024.
//

/// Регистрация сервисов с зависимостями
// let container = DIContainer.shared
//container.register({ NetworkServiceImpl() as NetworkService }, for: NetworkService.self)
//container.register({ DatabaseServiceImpl(networkService: container.resolve(NetworkService.self)) as DatabaseService }, for: DatabaseService.self)
/// Регистрация синглтона
//
// container.registerSingleton(AppSettings.shared, for: AppSettings.self)

class DIContainer {
	static let shared = DIContainer()

	private init() {}

	private var services: [String: Any] = [:]
	private var singletons: [String: Any] = [:]

	func register<T>(_ service: @autoclosure @escaping () -> T, for type: T.Type) {
		let key = String(describing: type)
		services[key] = service
	}

	func registerSingleton<T>(_ service: @autoclosure @escaping () -> T, for type: T.Type) {
		let key = String(describing: type)
		singletons[key] = service
	}

	func resolve<T>(_ type: T.Type) -> T {
		let key = String(describing: type)
		if let singletonService = singletons[key] as? () -> T {
			let instance = singletonService()
			services[key] = instance
			singletons[key] = nil
			return instance
		} else if let service = services[key] as? () -> T {
			return service()
		} else if let instance = services[key] as? T {
			return instance
		} else {
			fatalError("Service of type \(type) is not registered")
		}
	}
}
