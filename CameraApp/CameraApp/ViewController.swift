//
//  ViewController.swift
//  CameraApp
//
//  Created by Улько Артем Викторович on 21.03.2023.
//

import UIKit
import AVFoundation

protocol PermissionService {}

class ViewController: UIViewController {

	private let sessionQueue = DispatchQueue(label: "session queue")

	private var timer: Timer?
	private var recognitionTime = 0.0

	lazy var takePhotoButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.setTitle("Take Photo", for: .normal)
		$0.contentEdgeInsets.left = 12
		$0.contentEdgeInsets.right = 12
		$0.contentEdgeInsets.top = 8
		$0.contentEdgeInsets.bottom = 8
		$0.setTitleColor(.blue, for: .normal)
		$0.setTitleColor(.gray, for: .highlighted)
		$0.titleLabel?.font = .init(.systemFont(ofSize: 24, weight: .heavy))
		$0.layer.borderWidth = 1
		$0.layer.borderColor = UIColor.blue.cgColor
		$0.addTarget(self, action: #selector(takePicture), for: .touchUpInside)
		return $0
	}(UIButton())

	let session = AVCaptureSession()

	var permissionsService: PermissionService?
	var camera: AVCaptureDevice?
	var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
	var cameraCaptureOutput: AVCapturePhotoOutput? = AVCapturePhotoOutput()

	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		initializeCaptureSession()
	}

	private func setup() {
		view.backgroundColor = .white
		view.addSubview(takePhotoButton)
		let takePhotoButtonConstraints: [NSLayoutConstraint] = [
			takePhotoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
			takePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		]
		NSLayoutConstraint.activate(takePhotoButtonConstraints)
		
	}

	private func initializeCaptureSession() {
		session.sessionPreset = AVCaptureSession.Preset.high
		camera = AVCaptureDevice.default(for: .video)

		guard
			let camera = camera,
			let cameraCaptureInput = try? AVCaptureDeviceInput(device: camera),
			let cameraCaptureOutput = cameraCaptureOutput
		else { return }
 
		session.addInput(cameraCaptureInput)
		session.addOutput(cameraCaptureOutput)

		cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
		cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
		cameraPreviewLayer?.frame = view.bounds
		cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
		
		view.layer.insertSublayer(cameraPreviewLayer!, at: 0)

		sessionQueue.async {
			self.session.startRunning()
		}
	}

	@objc private func takePicture() {
		let settings = AVCapturePhotoSettings()
		settings.flashMode = .auto
		cameraCaptureOutput?.capturePhoto(with: settings, delegate: self)
	}

	private func displayCapturedPhoto(capturedPhoto: UIImage) {
		let photoViewController = PhotoViewController()
		photoViewController.setImage(capturedPhoto)
		present(photoViewController, animated: true)
	}
}

extension ViewController: AVCapturePhotoCaptureDelegate {
	
	func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
		if
			let imageData = photo.fileDataRepresentation(),
			let image = UIImage(data: imageData) {
			displayCapturedPhoto(capturedPhoto: image)
		}
	}
}
