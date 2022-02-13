//
//  ViewController.swift
//  CoordinatorSimple
//
//  Created by user on 11.02.2022.
//

import UIKit

protocol ListBreedsViewDisplay: AnyObject {
    func startActivityIndicator()
    func stopActivityIndicator()
    func setBreeds (with breeds: [ListBreedsViewModel])
}

final class ListBreedsViewController: UIViewController {
    private let presenter: ListBreedsPresenterInput
    private let activityIndicator: UIActivityIndicatorView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.style = .large
        $0.color = .gray
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView())
    private let tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())
    private var breeds: [ListBreedsViewModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    init(presenter: ListBreedsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        title = "Doggie App"
        
        view.addSubview(activityIndicator)
        let activityIndicatorConstraints: [NSLayoutConstraint] = [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(activityIndicatorConstraints)
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        let tableViewConstraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
        
    }
}

extension ListBreedsViewController: ListBreedsViewDisplay {
    public func startActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
        
    }
    
    public func stopActivityIndicator() {
        DispatchQueue.main.async {  [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    public func setBreeds (with breeds: [ListBreedsViewModel]) {
        self.breeds = breeds
    }
}

extension ListBreedsViewController: UITableViewDelegate {
    
}

extension ListBreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let viewModel = breeds[indexPath.row]
        cell.textLabel?.text = viewModel.breed
        return cell
    }
}
