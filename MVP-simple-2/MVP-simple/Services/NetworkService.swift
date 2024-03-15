//
//  NetworkService.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCharacters(complition: @escaping (Result<[Character], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getCharacters(complition: @escaping (Result<[Character], Error>) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character?page=1"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            if let error = error {
                complition(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            let charactersResponse = try? JSONDecoder().decode(CharactersResponse.self, from: data)
            
            guard let charactersResponseData = charactersResponse else {
                complition(.failure(NSError()))
                return
            }
            complition(.success(charactersResponseData.results))
        }.resume()
    }
    
    
}
