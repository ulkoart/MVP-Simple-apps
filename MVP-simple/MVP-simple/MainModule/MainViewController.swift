//
//  ViewController.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    
    private let tableView: UITableView = {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .singleLine
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return $0
    }(UITableView())


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List"
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.charecters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        guard let charecter = presenter?.charecters[indexPath.item] else { return cell }
        cell.textLabel?.text = "\(charecter.name)"
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let character = presenter?.charecters[indexPath.item] else { return }
        presenter?.tapOnCharacter(character: character)
    }
}
