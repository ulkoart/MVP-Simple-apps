//
//  PhotoViewController.swift
//  CameraApp
//
//  Created by Улько Артем Викторович on 21.03.2023.
//

import UIKit

final class PhotoViewController: UIViewController {
	private let imageView = UIImageView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(imageView)
		imageView.frame = view.frame
	}
}

extension PhotoViewController {
	func setImage(_ image: UIImage) {
		imageView.image = image
		imageView.setNeedsLayout()
	}
}
