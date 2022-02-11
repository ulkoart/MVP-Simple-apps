//
//  ViewController.swift
//  MVVM-Arch
//
//  Created by user on 11.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var viewModel: MainViewModelProtocol!
    private var mainView: MainView!

    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
        createView()
        updateView()
        viewModel.startFetch()
    }
    
    private func createView() {
        mainView = MainView()
        mainView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        mainView.center = view.center
        view.addSubview(mainView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.mainView.viewData = viewData
        }
    }
}

