//
//  RequestProtocol.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 26.01.2022.
//

import Foundation

protocol RequestProtocol{
    
    associatedtype Response
    var url: String { get }
    var baseURL: String { get }
    var httpMetot: HTTPMethod { get }
    var queryItems: [String:String] { get }
    func decode(data: Data) throws -> Response
}

extension RequestProtocol{
    
    var queryItems: [String: String] { [:] }
    var baseURL: String { URL.baseUrl }
}

extension RequestProtocol where Response: Decodable {
    
    func decode(data: Data) throws -> Response{
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
