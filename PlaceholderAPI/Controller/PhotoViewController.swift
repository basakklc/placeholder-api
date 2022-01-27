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
    var viewModel:PhotoListViewModel = PhotoListViewModel(service: DefaultService())
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureContents()
        viewModel.fetchPhotos()
    }
    
    func configureContents() {
        
        viewModel.viewModelDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
        let nibCellName: UINib = UINib(nibName: "PhotoTableViewCell", bundle: nil)
        tableView.register(nibCellName, forCellReuseIdentifier: "photoCell")
    }
}

extension PhotoViewController: PhotoListViewModelDelegate{
    
    func requestCompleted() {
        list = viewModel.getList()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PhotoViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotoTableViewCell
        let imageUrl = list[indexPath.row].thumbnailUrl! + ".png"
        cell.configureContents(imageUrl, titleText: list[indexPath.row].title!)
        return cell
    }
}

extension PhotoViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenPhoto = list[indexPath.row]
        let destination: PhotoDetailViewController = dataTransferToDetailVC()
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func dataTransferToDetailVC() -> PhotoDetailViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destination: PhotoDetailViewController = storyBoard.instantiateViewController(withIdentifier: "photoDetail") as! PhotoDetailViewController
        destination.titleText = choosenPhoto.title!
        destination.thumbnailUrl = choosenPhoto.thumbnailUrl! + ".png"
        destination.id = choosenPhoto.id
        return destination
    }

}
