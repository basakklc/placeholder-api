//
//  Photo.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 17.01.2022.
//

import Foundation

struct Photo: Codable {
    
    var albumId: Int?
    var id: Int?
    var title: String?
    var thumbnailUrl: String?
    
    enum CodingKeys: CodingKey {
        case albumId, id, title, thumbnailUrl
    }
}
