//
//  ListBreedsViewModelFactory.swift
//  CoordinatorSimple
//
//  Created by user on 18.02.2022.
//

import Foundation

protocol BreedsViewModelFactoryProtocol {
    func makeViewModel (breedItem: Dictionary<String, [String]>.Element) -> BreedViewModelProtocol
}

final class BreedsViewModelFactory: BreedsViewModelFactoryProtocol {
    /// Метод создания BreedsViewModel
    /// - Parameter breedItem: элемент словаря из ответа апи'
    /// - Returns: BreedsViewModel
    func makeViewModel(breedItem: Dictionary<String, [String]>.Element) -> BreedViewModelProtocol {
        let breedName = breedItem.key
        let hasSubBreeds = breedItem.value.isEmpty
        
        let firstLetter = String(breedName.prefix(1).capitalized)
        let otherLetters = String(breedName.dropFirst())
        let breedNameCapitalized = firstLetter + otherLetters
        
        return BreedViewModel(breed: breedNameCapitalized, hasSubBreeds: hasSubBreeds)
    }
}
