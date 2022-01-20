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
    
    let apiService = ApiService()
    
    var titleText = ""
    var thumbnailUrl = ""
    var id:Int?
    var list = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        fetchComments()
    }
    
    func configureContents() {
        commentTableView.delegate = self
        commentTableView.dataSource = self
        photoTitle.text = titleText
        downloadImage(url: thumbnailUrl)
    }
    
    func fetchComments(){
        apiService.getCommentsByPhoto(photoId: id) { (comments) in
            self.list = comments
            DispatchQueue.main.async {
                self.commentTableView.reloadData()
            }
        }
    }
    
    func downloadImage(url:String){
        let url = URL(string: thumbnailUrl)
        do{
            if let url = url {
                let data = try Data(contentsOf: url)
                photoImageView.image = UIImage(data: data)
            }
        }catch{
            print("err")
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
