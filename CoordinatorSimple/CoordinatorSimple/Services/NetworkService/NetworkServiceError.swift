//
//  NetworkServiceError.swift
//  CoordinatorSimple
//
//  Created by user on 23.03.2022.
//

import Foundation

enum NetworkServiceError: Error {
    case unknown
    case badUrlComponent
    
    var message: String {
        switch self {
        case .unknown:
            return "Unknown error"
        case .badUrlComponent:
            return "Bad UrlComponent"
        }
    }

}
