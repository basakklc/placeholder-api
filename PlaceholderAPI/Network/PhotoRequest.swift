//
//  PhotoRequest.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 26.01.2022.
//

import Foundation

struct PhotoRequest: RequestProtocol {

    typealias Response = [Photo]
    var url: String { return baseURL + "photos" }
    var httpMetot: HTTPMethod { .get }
}
