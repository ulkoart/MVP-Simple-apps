//
//  ViewController.swift
//  BottomSheet
//
//  Created by Улько Артем Викторович on 20.06.2022.
//

import UIKit

final class ViewController: UIViewController {
	// текст - https://fish-text.ru/
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Допустим, так"
		label.font = .boldSystemFont(ofSize: 32)
		return label
	}()
	
	private lazy var textView: UITextView = {
		let textView = UITextView(frame: .zero)
		textView.font = UIFont.systemFont(ofSize: 16)
		textView.isEditable = false
		textView.text = "Внезапно, базовые сценарии поведения пользователей, инициированные исключительно синтетически, ассоциативно распределены по отраслям. Лишь явные признаки победы институционализации ассоциативно распределены по отраслям. Безусловно, постоянный количественный рост и сфера нашей активности прекрасно подходит для реализации новых предложений. Следует отметить, что высококачественный прототип будущего проекта однозначно определяет каждого участника как способного принимать собственные решения касаемо укрепления моральных ценностей."
		return textView
	}()
	
	private lazy var registerButton: UIButton = {
		let button = UIButton()
		button.setTitle("Поехали", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = view.tintColor
		button.layer.cornerRadius = 8
		button.clipsToBounds = true
		return button
	}()
	
	private lazy var containerStackView: UIStackView = {
		let spacer = UIView()
		let stackView = UIStackView(arrangedSubviews: [titleLabel, textView, spacer, registerButton])
		stackView.axis = .vertical
		stackView.spacing = 16.0
		return stackView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupConstraints()

		registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
	}
	
	private func setupView() {
		view.backgroundColor = .systemBackground
	}
	
	private func setupConstraints() {
		view.addSubview(containerStackView)
		containerStackView.translatesAutoresizingMaskIntoConstraints = false
		let safeArea = view.safeAreaLayoutGuide
		
		NSLayoutConstraint.activate([
			containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
			containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -24),
			containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
			containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
			registerButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}
	
	@objc private func presentModalController() {
		let vc = CustomModalViewController()
		vc.modalPresentationStyle = .overCurrentContext
		self.present(vc, animated: false)
	}
}

