//
//  ViewController.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//

import UIKit

class WhiteController: UIViewController {

    var coordinator: WhiteFlow?

    private let startButton: UIButton = {
        $0.setTitle("Войти", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.systemBlue
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 5
        $0.layer.shadowColor = UIColor.systemTeal.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize(width: -1, height: 3)
        $0.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @objc func startTapped(_ sender: UIButton) {
         coordinator?.coordinateToTabBar()
    }

    private func setup() {
        view.backgroundColor = .white
        self.view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
