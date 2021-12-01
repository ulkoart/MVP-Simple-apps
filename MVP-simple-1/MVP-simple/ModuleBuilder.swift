//
//  ModuleBuilder.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Randy", lastName: "Marsh")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
