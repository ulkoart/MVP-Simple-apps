//
//  DogService.swift
//  CoordinatorSimple
//
//  Created by user on 12.02.2022.
//

import Foundation

struct AllBreedsDTO: Codable {
    let message: [String: [String]]
    let status: String
}

protocol DogServiceProtocol {
    func getListAllBreeds(completion: @escaping (Result<AllBreedsDTO, Error>) -> ())
}

class DogService: DogServiceProtocol {
    func getListAllBreeds(completion: @escaping (Result<AllBreedsDTO, Error>) -> ()) {
        let urlString = "https://dog.ceo/api/breeds/list/all"
        guard let url = URL(string: urlString) else { return }
        let session: URLSession = .shared
        let decoder: JSONDecoder = .init()
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            
            do {
                let allBreedsResponse = try decoder.decode(AllBreedsDTO.self, from: data)
                completion(.success(allBreedsResponse))
            } catch {
                completion(.failure(NSError()))
            }
        }.resume()
    }
}
