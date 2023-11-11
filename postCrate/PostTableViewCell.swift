//
//  PostTableViewCell.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/11/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
