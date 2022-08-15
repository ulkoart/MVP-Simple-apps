//
//  CustomModalViewController.swift
//  BottomSheet
//
//  Created by Улько Артем Викторович on 20.06.2022.
//

import UIKit

class CustomModalViewController: UIViewController {
	
	let maxDimmedAlpha: CGFloat = 0.6 // прозрачность фона
	let defaultHeight: CGFloat = 300 // высота шторки
	let dismissibleHeight: CGFloat = 200
	let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
	var currentContainerHeight: CGFloat = 300
	
	var containerViewHeightConstraint: NSLayoutConstraint?
	var containerViewBottomConstraint: NSLayoutConstraint?
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Поехали"
		label.font = .boldSystemFont(ofSize: 20)
		return label
	}()
	
	lazy var notesLabel: UILabel = {
		let label = UILabel()
		label.text = "Учитывая ключевые сценарии поведения, разбавленное изрядной долей эмпатии, рациональное мышление позволяет оценить значение модели развития.\n\nВысокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: дальнейшее развитие различных форм деятельности выявляет срочную потребность распределения внутренних резервов и ресурсов.\n\nИ нет сомнений, что представители современных социальных резервов представлены в исключительно положительном свете.\n\nНо социально-экономическое развитие не даёт нам иного выбора, кроме определения анализа существующих паттернов поведения."
		label.font = .systemFont(ofSize: 16)
		label.textColor = .darkGray
		label.numberOfLines = 0
		return label
	}()

	lazy var contentStackView: UIStackView = {
		let spacer = UIView()
		let stackView = UIStackView(arrangedSubviews: [titleLabel, notesLabel, spacer])
		stackView.axis = .vertical
		stackView.spacing = 12.0
		return stackView
	}()
	
	lazy var containerView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.cornerRadius = 16
		view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		view.clipsToBounds = true
		return view
	}()
	
	lazy var dimmedView: UIView = {
		let view = UIView()
		view.backgroundColor = .black
		view.alpha = maxDimmedAlpha
		return view
	}()
	
	lazy var spacerGray: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 3
		view.backgroundColor = .systemGray4
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupConstraints()
		setupPanGesture()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		animateShowDimmedView()
		animatePresentContainer()
	}
	
	private func animateShowDimmedView() {
		dimmedView.alpha = 0
		UIView.animate(withDuration: 0.4) {
			self.dimmedView.alpha = self.maxDimmedAlpha
		}
	}
	
	private func animatePresentContainer() {
		UIView.animate(withDuration: 0.3) {
			self.containerViewBottomConstraint?.constant = 0
			self.view.layoutIfNeeded()
		}
	}
	
	private func animateDismissView() {
		UIView.animate(withDuration: 0.3) {
			self.containerViewBottomConstraint?.constant = self.currentContainerHeight
			self.view.layoutIfNeeded()
		}
		
		dimmedView.alpha = maxDimmedAlpha
		UIView.animate(withDuration: 0.4) {
			self.dimmedView.alpha = 0
		} completion: { _ in
			self.dismiss(animated: false)
		}
	}
	
	private func setupView() {
		view.backgroundColor = .clear
	}
	
	private func setupConstraints() {

		view.addSubview(dimmedView)
		view.addSubview(containerView)
		containerView.addSubview(spacerGray)
		containerView.addSubview(contentStackView)

		spacerGray.translatesAutoresizingMaskIntoConstraints = false
		dimmedView.translatesAutoresizingMaskIntoConstraints = false
		containerView.translatesAutoresizingMaskIntoConstraints = false
		contentStackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
			dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
			contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
			contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
			contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
			
			spacerGray.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
			spacerGray.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
			spacerGray.widthAnchor.constraint(equalToConstant: 80),
			spacerGray.heightAnchor.constraint(equalToConstant: 6)
		])
		
		containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
		containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
		containerViewHeightConstraint?.isActive = true
		containerViewBottomConstraint?.isActive = true
		
		
	}
	
	private func setupPanGesture() {
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
		panGesture.delaysTouchesBegan = false
		panGesture.delaysTouchesEnded = false
		view.addGestureRecognizer(panGesture)

		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
		view.addGestureRecognizer(tapGesture)
	}
	
	@objc func handleTap(sender: UITapGestureRecognizer) {
		let tapPoint = sender.location(in: view)

		if tapPoint.y < containerView.frame.origin.y {
			animateDismissView()
		}
	}
	
	@objc private func handlePanGesture(gesture: UIPanGestureRecognizer) {
		let translation = gesture.translation(in: view)

		print("Pan gesture y offset: \(translation.y)")

		let isDraggingDown = translation.y > 0
		print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
		
		let newHeight = currentContainerHeight - translation.y
		
		switch gesture.state {
		case .changed:
			if newHeight < maximumContainerHeight {
				containerViewHeightConstraint?.constant = newHeight
				view.layoutIfNeeded()
			}
		case .ended:
			if newHeight < dismissibleHeight {
				self.animateDismissView()
			}
			else if newHeight < defaultHeight {
				animateContainerHeight(defaultHeight)
			}
			else if newHeight < maximumContainerHeight && isDraggingDown {
				animateContainerHeight(defaultHeight)
			}
			else if newHeight > defaultHeight && !isDraggingDown {
				animateContainerHeight(maximumContainerHeight)
			}
		default:
			break
		}
	}
	
	func animateContainerHeight(_ height: CGFloat) {
		UIView.animate(withDuration: 0.4) {
			self.containerViewHeightConstraint?.constant = height
			self.view.layoutIfNeeded()
		}
		currentContainerHeight = height
	}
}
