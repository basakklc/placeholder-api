//
//  PhotoViewCell.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 21.01.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoCellimageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureContents(_ imageUrl: String, titleText: String){
        photoCellimageView.loadImage(url: imageUrl)
        titleLabel.text = titleText
    }
}
