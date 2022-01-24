//
//  ApiService.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 18.01.2022.
//

import Foundation

class ApiService {
    
    static var service = ApiService()
    
    func getAllPhoto(completionHandler: @escaping ([Photo])->()){
        
        URLSession.shared.dataTask(with: URL.photos){ (data, response, error) in
            if let error = error{
               print(error)
            }
            if let data = data {
                do{
                    let jsonResult = try JSONDecoder().decode([Photo].self, from: data)
                    completionHandler(jsonResult)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getCommentsByPhoto(photoId: Int?, completionHandler: @escaping ([Comment])->()){
        
        if let id = photoId {
            URLSession.shared.dataTask(with: URL.comments(withID: id)){ (data, response, error) in
                if let error = error {
                    print(error)
                }
                if let data = data {
                    do{
                        let jsonResult = try JSONDecoder().decode([Comment].self, from: data)
                        completionHandler(jsonResult)
                    }catch{
                        print("error")
                    }
                }
            }.resume()
        }
    }
}
