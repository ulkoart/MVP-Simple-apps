//
//  ViewController.swift
//  CoordinatorSimple
//
//  Created by user on 11.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    private let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .init(.systemFont(ofSize: 24, weight: .light))
        $0.numberOfLines = 1
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension MainViewController {
    func setup() {
        view.backgroundColor = .white
        title = "Coordinator App"
        
        view.addSubview(titleLabel)
        titleLabel.text = "Coordinator Simple App"
        let titleLabelConstraints: [NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
}
