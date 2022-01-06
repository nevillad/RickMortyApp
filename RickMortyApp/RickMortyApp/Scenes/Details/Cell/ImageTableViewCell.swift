//
//  ImageTableViewCell.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 07/01/22.
//

import UIKit

let IMAGE_TABLEVIEW_CELL_ID = "ImageTableViewCell"

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var ivProfile: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
