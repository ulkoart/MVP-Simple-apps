//
//  BlueViewController.swift
//  Coordinator1
//
//  Created by user on 13.08.2022.
//
import UIKit

class BlueViewController: UIViewController {
    var coordinator: BlueFlow?
    
    private let showDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.blue.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(showDetailTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .blue
        self.view.addSubview(showDetailButton)
        
        NSLayoutConstraint.activate([
            showDetailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            showDetailButton.heightAnchor.constraint(equalToConstant: 50),
            showDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            showDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func showDetailTapped(_ sender: UIButton) {
        coordinator?.coordinateToDetail()
    }
}
