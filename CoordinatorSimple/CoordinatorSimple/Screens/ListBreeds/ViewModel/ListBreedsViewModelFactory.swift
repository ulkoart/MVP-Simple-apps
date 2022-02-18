//
//  ListBreedsViewModelFactory.swift
//  CoordinatorSimple
//
//  Created by user on 18.02.2022.
//

import Foundation

protocol ListBreedsViewModelFactoryProtocol {
    func makeViewModel (breedName: String) -> ListBreedsViewModel
}

final class ListBreedsViewModelFactory: ListBreedsViewModelFactoryProtocol {
    func makeViewModel(breedName: String) -> ListBreedsViewModel {
        return .init(breed: breedName)
    }
}
