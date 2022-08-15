//
//  BlueDetailViewController.swift
//  Coordinator1
//
//  Created by user on 15.08.2022.
//

import UIKit

class BlueDetailViewController: UIViewController {
    
    var coordinator: BlueDetailFlow?
    
    private let dismissDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss blue detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGray
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(dismissDetailTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(dismissDetailButton)
        
        NSLayoutConstraint.activate([
            dismissDetailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            dismissDetailButton.heightAnchor.constraint(equalToConstant: 50),
            dismissDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dismissDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func dismissDetailTapped(_ sender: UIButton) {
         coordinator?.dismissDetail()
    }
    
}

