//
//  CommentRequest.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 26.01.2022.
//

import Foundation

struct CommentRequest: RequestProtocol{
    
    typealias Response = [Comment]
    var id: Int?
    var url: String { return baseURL + "comments" }
    var httpMetot: HTTPMethod { .get }
    var queryItems: [String : String] {
        guard let id = id else {
           return [:]
        }
        return ["postId": String(id)]
    }
}
