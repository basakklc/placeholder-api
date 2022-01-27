//
//  PhotoListViewModel.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 24.01.2022.
//

import Foundation
import UIKit

protocol PhotoListViewModelDelegate {
    
    func requestCompleted()
}

class PhotoListViewModel {
    
    var viewModelDelegate : PhotoListViewModelDelegate?
    var photoList: [Photo] = [Photo]()
    private let networkService: NetworkService
    
    init(service: NetworkService){
        self.networkService = service
    }
    
    func fetchPhotos() {
        
        let request = PhotoRequest()
        networkService.httpGetRequest(request){ result in
            switch result{
            case .success(let photos):
                self.photoList = photos
                self.viewModelDelegate?.requestCompleted()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func getList() -> [Photo]{
        return photoList
    }
}
