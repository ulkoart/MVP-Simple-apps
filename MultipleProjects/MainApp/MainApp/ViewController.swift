//
//  ViewController.swift
//  MainApp
//
//  Created by Улько Артем Викторович on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {
	private let keker: KekerProtocol

	private let label: UILabel = {
		$0.text = "MainApp"
		$0.translatesAutoresizingMaskIntoConstraints = false
		return $0
	}(UILabel())

	init(keker: KekerProtocol) {
		self.keker = keker
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		keker.kek()
		setup()
	}

	private func setup() {
		title = "Test App"

		view.backgroundColor = .white
		view.addSubview(label)
		
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}
}

