//
//  MainViewPresenter.swift
//  CoordinatorSimple
//
//  Created by user on 12.02.2022.
//

import Foundation

protocol ListBreedsPresenterInput: AnyObject {
    func viewDidAppear()
}

protocol ListBreedsPresenterOutput: AnyObject {
    func loadBreedsSuccess(with allBreeds: AllBreedsDTO)
}

class ListBreedsPresenter {
    weak var viewController: ListBreedsViewDisplay?
    var interactor: ListBreedsInteractorProtocol
    
    init(interactor: ListBreedsInteractorProtocol) {
        self.interactor = interactor
    }
}

extension ListBreedsPresenter: ListBreedsPresenterInput {
    public func viewDidAppear() {
        viewController?.startActivityIndicator()
        interactor.loadBreeds()
    }
}

extension ListBreedsPresenter: ListBreedsPresenterOutput {
    /// мэпинг AllBreedsDTO во вьюмодели listVew
    public func loadBreedsSuccess(with allBreeds: AllBreedsDTO) {
        let breeds: [ListBreedsViewModel] = allBreeds.message.keys.map { .init(breed: $0) }
        viewController?.stopActivityIndicator()
        viewController?.setBreeds(with: breeds)
    }
}
