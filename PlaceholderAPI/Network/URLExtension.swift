//
//  URLExtension.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 19.01.2022.
//

import Foundation

extension URL {
    
    static var photos: URL {
        URL(string: "https://jsonplaceholder.typicode.com/photos")!
    }
    
    static func comments(withID id: Int) -> URL{
        URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(id)")!
    }
}
