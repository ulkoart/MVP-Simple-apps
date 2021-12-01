//
//  Person.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let gender: Gender
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}
