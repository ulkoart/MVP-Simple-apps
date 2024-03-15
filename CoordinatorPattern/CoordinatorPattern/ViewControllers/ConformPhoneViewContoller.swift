//
//  ConformPhoneViewContoller.swift
//  CoordinatorPattern
//
//  Created by Улько Артем Викторович on 11.01.2024.
//

import UIKit

class ConformPhoneViewContoller: UIViewController {

	private var userData: UserData?

	var completionHandler: ((Bool) -> ())?

	private var textField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.borderStyle = .roundedRect
		textField.placeholder = "Enter Code"
		return textField
	}()

	private var nextButton: UIButton = {
		let nextButton = UIButton()
		nextButton.translatesAutoresizingMaskIntoConstraints = false
		nextButton.setTitle("Next", for: .normal)
		nextButton.setTitleColor(.systemGray, for: .normal)
		nextButton.layer.borderWidth = 1
		nextButton.layer.cornerRadius = 4
		nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
		return nextButton
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViewContoller()
	}

	private func setupViewContoller() {
		self.title = "EnterCode"

		view.backgroundColor = .systemBackground

		view.addSubview(textField)
		view.addSubview(nextButton)

		NSLayoutConstraint.activate([
			textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			textField.widthAnchor.constraint(equalToConstant: 250),

			nextButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 24),
			nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 250)
		])
	}

	@objc private func nextButtonPressed(_ sender: Any) {
		completionHandler?(true)
	}
}

extension ConformPhoneViewContoller {
	func setup(userData: UserData?) {
		self.userData = userData
	}
}

extension ConformPhoneViewContoller: RegistrationFlowController {}
