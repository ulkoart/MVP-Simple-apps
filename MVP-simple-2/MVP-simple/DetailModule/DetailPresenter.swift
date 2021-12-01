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
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, character: Character?)
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol?
    let character: Character?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, character: Character?) {
        self.view = view
        self.networkService = networkService
        self.character = character
    }
    
    func setComment() {
        guard let character = character else { return }
        self.view?.setCharecter(character: character)
    }
}
