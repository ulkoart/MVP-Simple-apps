//
//  MainViewInteractor.swift
//  CoordinatorSimple
//
//  Created by user on 12.02.2022.
//

import Foundation

protocol ListBreedsInteractorProtocol: AnyObject {
    func loadBreeds()
}

final class ListBreedsInteractor: ListBreedsInteractorProtocol {
    weak var presenter: ListBreedsPresenterOutput?
    let dogService: DogServiceProtocol
    
    init(dogService: DogServiceProtocol) {
        self.dogService = dogService
    }
    
    func loadBreeds() {
        dogService.getListAllBreeds { [weak self] responseResult in
            switch responseResult {
            
            case .success(let allBreeds):
                self?.presenter?.loadBreedsSuccess(with: allBreeds)
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
