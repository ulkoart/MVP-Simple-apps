//
//  ViewController.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    
    let label: UILabel = {
        $0.text = "MVP Simple"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .init(white: 0.6, alpha: 1)
        $0.font = .init(.systemFont(ofSize: 24, weight: .semibold))
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .heavy))

        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Module"
        
        view.backgroundColor = .white
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/6)
        ])
        
        view.addSubview(actionButton)
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            actionButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/8)
        ])
        
    }
    
    @objc func actionButtonTapped() {
        self.presenter?.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.label.text = greeting
    }
}
