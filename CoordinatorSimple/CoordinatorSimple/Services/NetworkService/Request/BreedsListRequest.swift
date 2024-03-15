//
//  BreedsListRequest.swift
//  CoordinatorSimple
//
//  Created by user on 23.03.2022.
//

import Foundation

struct BreedsListRequest: DataRequest {
    typealias Response = AllBreedsDTO
    
    var url: String {
        let baseURL: String = "https://dog.ceo/api"
        let path: String = "/breeds/list/all"
        return baseURL + path
    }
    
    var method: HTTPMethod {
        .get
    }
}
