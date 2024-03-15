//
//  DetailPresenter.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setCharecter(character: Character)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, character: Character?, router: RouterProtocol)
    func setComment()
    func tapCancel()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol?
    let character: Character?
    let router: RouterProtocol?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, character: Character?, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.character = character
        self.router = router
    }
    
    func setComment() {
        guard let character = character else { return }
        self.view?.setCharecter(character: character)
    }
    
    func tapCancel() {
        router?.popToRoot()
    }
}
