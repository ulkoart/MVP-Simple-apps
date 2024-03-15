//
//  ViewController.swift
//  Waterfall
//
//  Created by Улько Артем Викторович on 06.07.2022.
//

import UIKit

struct CellViewModel {
	let imageName: String
	let height: CGFloat
}

class ViewController: UIViewController {

	private let сollectionView: UICollectionView = {
		let layout = PinterestLayout()
		let сollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		сollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifire)
		return сollectionView
	}()

	private var viewModels = [CellViewModel]()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(сollectionView)

		сollectionView.delegate = self
		сollectionView.dataSource = self

		if let layout = сollectionView.collectionViewLayout as? PinterestLayout {
			layout.delegate = self
		}
		
		let images = Array(1...9).map { "image\($0)" }
		viewModels = images.compactMap {
			.init(imageName: $0, height: CGFloat.random(in: 100...500))
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		сollectionView.frame = view.bounds
	}
}

extension ViewController: PinterestLayoutDelegate {
	func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
		let viewModel = viewModels[indexPath.item]
		return viewModel.height
	}
}

extension ViewController: UICollectionViewDelegate {
	
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		viewModels.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifire, for: indexPath) as? ImageCollectionViewCell else { fatalError() }
		let viewModel = viewModels[indexPath.item]
		let image = UIImage(named: viewModel.imageName)
		cell.configure(image: image)
		return cell
	}
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		return .init(width: view.frame.size.width / 2, height: 300)
//	}
//}

