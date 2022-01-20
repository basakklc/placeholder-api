//
//  ViewController.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 17.01.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var list: [Photo] = [Photo]()
    var choosenPhoto: Photo = Photo()
    let apiService: ApiService = ApiService()
    var imageData: Data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        fetchPhotos()
    }
    
    func configureContents() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchPhotos() {
        apiService.getAllPhoto { photos in
            self.list = photos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension PhotoViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! PhotoTableViewCell
        let imageUrl = list[indexPath.row].thumbnailUrl! + ".png"
        cell.photoImageView.loadImage(url: imageUrl)
        cell.label.text = "\(list[indexPath.row].title!)"
        return cell
    }
}


//tableview deque.
// seguesiz navigationController
//view model

extension PhotoViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       choosenPhoto = list[indexPath.row]
       performSegue(withIdentifier: "photoDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoDetailVC" {
            let destination = segue.destination as! PhotoDetailViewController
            destination.titleText = choosenPhoto.title!
            destination.thumbnailUrl = choosenPhoto.thumbnailUrl! + ".png"
            destination.id = choosenPhoto.id
        }
    }
}
