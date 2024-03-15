//
//  MainPresenter.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getCharecters()
    var charecters: [Character] { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol?
    var charecters = [Character]()
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getCharecters()
    }
    
    func getCharecters() {
        networkService?.getCharacters(complition: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let charecters):
                    self?.charecters = charecters
                    self?.view?.succes()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        })
    }
}
