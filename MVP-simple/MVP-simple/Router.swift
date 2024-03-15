//
//  Router.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(character: Character?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let mainModule = assemblyBuilder?.createMainModule(router: self) else { return }
        navigationController.viewControllers = [mainModule]
    }
    
    func showDetail(character: Character?) {
        guard let navigationController = navigationController else { return }
        guard let detailModule = assemblyBuilder?.createDetailModule(character: character, router: self) else { return }
        navigationController.pushViewController(detailModule, animated: true)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
    

    
    
}
