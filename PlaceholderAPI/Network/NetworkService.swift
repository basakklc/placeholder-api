//
//  NetworkService.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 26.01.2022.
//

import Foundation

protocol NetworkService{
    
    func httpGetRequest<T: RequestProtocol>(_ request: T, completion: @escaping (Result<T.Response, Error>)->Void)
}

final class DefaultService: NetworkService{
    
    var urlQueryItems: [URLQueryItem] = []
    
    func httpGetRequest<T>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void) where T : RequestProtocol {
        
        let urlRequest: Result<URLRequest, Error> = createURLRequest(request)
        
        switch urlRequest{
        case .success(let urlRequest):
            callRequest(urlRequest,request,completion)
        case .failure(let error):
            completion(.failure(error))
        }
    }
}

extension DefaultService {
    
    func createURLRequest<T: RequestProtocol>(_ request: T) -> Result<URLRequest, Error> {
        
        if var urlComponent = URLComponents(string: request.url) {
            createURLQueryItem(request.queryItems)
            urlComponent.queryItems = urlQueryItems
            
            if let url = urlComponent.url {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = request.httpMetot.rawValue
                return .success(urlRequest)
            }
        }
        return .failure(APIError.invalidUrl)
    }
    
    func createURLQueryItem(_ requestQueryItems: [String: String]){
       
        requestQueryItems.forEach{
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlQueryItems.append(urlQueryItem)
        }
    }
    
    func callRequest<T: RequestProtocol>(_ urlRequest: URLRequest, _ request: T, _ completion: @escaping (Result<T.Response, Error>) -> Void ) {
     
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    return completion(.failure(error))
                }else{
                    completion(.failure(APIError.invalidData))
                }
                return
            }
            do{
                try completion(.success(request.decode(data: data)))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
}
