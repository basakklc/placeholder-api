//
//  CommentTableViewCell.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 17.01.2022.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentBodyLabel: UILabel!
    @IBOutlet weak var commetNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
