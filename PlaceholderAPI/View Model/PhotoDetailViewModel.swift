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
    
    func fetchComment(photoId: Int?){
        ApiService.service.getCommentsByPhoto(photoId: photoId) { (comments) in
            self.commentList = comments
            self.viewModelDelegate?.requestCompleted()
        }
    }
    
    func getList() -> [Comment] {
        return commentList
    }
    
}
