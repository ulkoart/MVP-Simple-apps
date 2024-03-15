//
//  DogService.swift
//  CoordinatorSimple
//
//  Created by user on 12.02.2022.
//

import Foundation

protocol DogServiceProtocol {
    func getListAllBreeds(completion: @escaping (Result<AllBreedsDTO, Error>) -> Void)
}

class DogService: DogServiceProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getListAllBreeds(completion: @escaping (Result<AllBreedsDTO, Error>) -> Void) {
        let request = BreedsListRequest()
        networkService.request(request, completion: completion)
    }
}
