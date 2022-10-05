//
//  Coordinator.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit


/// Базовай протокол координатора
protocol Coordinator {

    /// Запуст координатора
    func start()

    /// Переход к другому координатору
    /// - Parameter coordinator: координатор
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
