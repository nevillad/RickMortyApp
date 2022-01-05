//
//  CustomTableViewCell.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import UIKit


let CUSTOM_TABLEVIEW_CELL_ID = "CustomTableViewCell"
class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: CustomLabel!
    @IBOutlet weak var lblSubtitle: CustomLabel!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var ivDisclosure: UIImageView!
    @IBOutlet weak var lblInfo: CustomLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ivIcon.tintColor = Color.primary.value
        ivDisclosure.tintColor = Color.primary.value
        lblTitle.numberOfLines = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
