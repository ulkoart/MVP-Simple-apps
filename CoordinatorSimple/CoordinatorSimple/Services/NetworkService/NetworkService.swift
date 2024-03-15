//
//  NetworkService.swift
//  CoordinatorSimple
//
//  Created by user on 23.03.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    typealias URLSessionHandler = (Data?, URLResponse?, Error?) -> Void
    private let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)

    /// - Parameters:
    ///   - request: запрос
    ///   - completion: комплишн
    func request<Request>(
        _ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void
    ) where Request : DataRequest {
        
        /// составной url
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = NetworkServiceError.badUrlComponent
            return completion(.failure(error))
        }
        
        /// параметры запроса
        var queryItems: [URLQueryItem] = []
        
        request.queryItems.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            let error = NetworkServiceError.unknown
            return completion(.failure(error))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        let handler: URLSessionHandler = { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                let error = NetworkServiceError.unknown
                return completion(.failure(error))
            }
            
            guard let data = data else {
                let error = NetworkServiceError.unknown
                return completion(.failure(error))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        
        let task = session.dataTask(with: urlRequest, completionHandler: handler)
        task.resume()
    }
    
}
