//
//  ImageCollectionViewCell.swift
//  Waterfall
//
//  Created by Улько Артем Викторович on 06.07.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
	static let identifire = "ImageCollectionViewCell"

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(imageView)
		contentView.clipsToBounds = true
		backgroundColor = .lightGray

		layer.cornerRadius = 16
		clipsToBounds = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.frame = contentView.bounds
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		imageView.image = nil
	}

	func configure(image: UIImage?) {
		imageView.image = image
	}
}
