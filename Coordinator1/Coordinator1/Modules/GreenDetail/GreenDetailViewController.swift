//
//  GreenDetailViewController.swift
//  Coordinator1
//
//  Created by user on 15.08.2022.
//

import UIKit

class GreenDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func dismissDetailTapped(_ sender: UIButton) {
        coordinator?.dismissDetail()
    }
    
    var coordinator: GreenDetailFlow?
    var greenItemTitle: String? {
        didSet {
            self.titleLabel.text = greenItemTitle
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemIndigo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dismissDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss detail", for: .normal)
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

    private func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(dismissDetailButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            
            dismissDetailButton.widthAnchor
                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            dismissDetailButton.heightAnchor
                .constraint(equalToConstant: 50),
            dismissDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dismissDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

}
