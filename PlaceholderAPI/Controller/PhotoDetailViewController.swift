//
//  PhotoDetailViewController.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 17.01.2022.
//

import UIKit



class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    
    let apiService: ApiService = ApiService()
    
    var titleText: String = ""
    var thumbnailUrl: String = ""
    var id:Int?
    var list: [Comment] = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        fetchComments()
    }
    
    func configureContents() {
        commentTableView.delegate = self
        commentTableView.dataSource = self
        photoTitle.text = titleText
        photoImageView.loadImage(url: thumbnailUrl)
    }
    
    func fetchComments() {
        apiService.getCommentsByPhoto(photoId: id) { (comments) in
            self.list = comments
            DispatchQueue.main.async {
                self.commentTableView.reloadData()
            }
        }
    }
}

extension PhotoDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell") as! CommentTableViewCell
        cell.commentBodyLabel.text = list[indexPath.row].body
        cell.commetNameLabel.text = list[indexPath.row].name
        return cell
    }
}

extension PhotoDetailViewController: UITableViewDelegate {
    
}
