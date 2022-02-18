//
//  ListBreedsViewModelFactory.swift
//  CoordinatorSimple
//
//  Created by user on 18.02.2022.
//

import Foundation

protocol ListBreedsViewModelFactoryProtocol {
    func makeViewModel (breedItem: Dictionary<String, [String]>.Element) -> ListBreedsViewModel
}

final class ListBreedsViewModelFactory: ListBreedsViewModelFactoryProtocol {
    func makeViewModel(breedItem: Dictionary<String, [String]>.Element) -> ListBreedsViewModel {
        let breedName = breedItem.key
        let hasSubBreeds = breedItem.value.isEmpty
        
        let firstLetter = String(breedName.prefix(1).capitalized)
        let otherLetters = String(breedName.dropFirst())
        let breedNameCapitalized = firstLetter + otherLetters
        
        return .init(breed: breedNameCapitalized, hasSubBreeds: hasSubBreeds)
    }
}
