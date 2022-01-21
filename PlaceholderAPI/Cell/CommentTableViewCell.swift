//
//  CommentViewCell.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 21.01.2022.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentNameLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureContents(nameText: String?, bodyText: String?){
        if let nameText = nameText { commentNameLabel.text = nameText }
        if let bodyText = bodyText { commentBodyLabel.text = bodyText }
    }
    
}
