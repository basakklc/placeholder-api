//
//  Comment.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 17.01.2022.
//

import Foundation

struct Comment: Codable{
    
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
    
    enum CodingKeys: CodingKey { 
        case postId, id, name, email, body
    }
}
