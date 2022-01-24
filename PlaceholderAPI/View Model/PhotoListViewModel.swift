//
//  PhotoListViewModel.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 24.01.2022.
//

import Foundation

protocol PhotoListViewModelDelegate {
    func requestCompleted()
}

class PhotoListViewModel {
    var viewModelDelegate : PhotoListViewModelDelegate?
    var photoList: [Photo] = [Photo]()
  
    func fetchPhotos() {
        ApiService.service.getAllPhoto { photos in
            self.photoList = photos
            self.viewModelDelegate?.requestCompleted()
        }
    }
    
    func getList() -> [Photo]{
        return photoList
    }
}
