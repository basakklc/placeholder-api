//
//  Constant.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 26.01.2022.
//

import Foundation

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
}

enum APIError: Error{
    case invalidUrl
    case invalidData
}

extension URL {
    static var baseUrl: String { "https://jsonplaceholder.typicode.com/" }
}
