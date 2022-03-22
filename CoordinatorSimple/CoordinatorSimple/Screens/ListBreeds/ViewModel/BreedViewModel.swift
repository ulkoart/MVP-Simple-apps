//
//  ListBreedsViewModel.swift
//  CoordinatorSimple
//
//  Created by user on 13.02.2022.
//

import Foundation

protocol BreedViewModelProtocol {
    var breed: String { get }
    var hasSubBreeds: Bool { get }
}

struct BreedViewModel: BreedViewModelProtocol {
    let breed: String
    let hasSubBreeds: Bool
}
