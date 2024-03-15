//
//  MainViewCoordinator.swift
//  CoordinatorSimple
//
//  Created by user on 11.02.2022.
//

import UIKit

class ListBreedsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isCompleted: (() -> ())?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    /// Запуск main
    func start() {
        let breedsViewModelFactory = BreedsViewModelFactory()
        let interactor = ListBreedsInteractor(dogService: DogService())
        let presenter = ListBreedsPresenter(interactor: interactor, viewModelFactory: breedsViewModelFactory)
        let viewController: ListBreedsViewController = .init(presenter: presenter)
        interactor.presenter = presenter
        presenter.viewController = viewController
        navigationController?.pushViewController(viewController, animated: false)
    }
}
