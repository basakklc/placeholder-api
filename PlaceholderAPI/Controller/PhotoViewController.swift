//
//  ViewController.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 17.01.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var list = [Photo]()
    var choosenPhoto = Photo()
    let apiService = ApiService()
    var imageData = Data()
    
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
        let data = imageGet(url: imageUrl)
        cell.photoImageView.image = UIImage(data: data)
        cell.label.text = "\(list[indexPath.row].title!)"
        return cell
    }
    
    func imageGet(url: String) -> Data {
        let url = URL(string: url)
        do{
            if let url = url {
                imageData = try Data(contentsOf: url)
            }
        }catch{
            print("err")
        }
        return imageData
    }
}


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
