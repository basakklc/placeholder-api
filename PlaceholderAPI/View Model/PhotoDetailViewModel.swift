//
//  PhotoDetailViewModel.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 24.01.2022.
//

import Foundation

protocol PhotoDetailViewModelDelegate{
    
    func requestCompleted()
}

class PhotoDetailViewModel {    
    
    var viewModelDelegate: PhotoDetailViewModelDelegate?
    var commentList: [Comment] = [Comment]()
    private let networkService: NetworkService
    
    init(service: NetworkService){
        self.networkService = service
    }
    
    func fetchComment(photoId: Int?){
       
        var request = CommentRequest()
        request.id = photoId
        networkService.httpGetRequest(request){ result in
            switch result{
            case .success(let comments):
                self.commentList = comments
                self.viewModelDelegate?.requestCompleted()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func getList() -> [Comment] {
        return commentList
    }
    
}
