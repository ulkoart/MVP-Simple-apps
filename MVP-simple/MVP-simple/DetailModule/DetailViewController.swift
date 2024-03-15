//
//  DetailView.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol?
    
    let label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .init(white: 0.6, alpha: 1)
        $0.font = .init(.systemFont(ofSize: 24, weight: .semibold))
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .heavy))

        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setComment()
        
        title = "Detail"
        view.backgroundColor = .white
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/8)
        ])
    }
    
    @objc func cancelButtonTapped() {
        presenter?.tapCancel()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setCharecter(character: Character) {
        label.text = character.name
    }
}
