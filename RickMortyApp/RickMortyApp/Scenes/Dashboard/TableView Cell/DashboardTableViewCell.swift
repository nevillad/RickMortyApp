//
//  DashboardTableViewCell.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import UIKit

let DASHBOARD_TABLEVIEW_CELL_ID = "DashboardTableViewCell"
class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: CustomLabel!
    @IBOutlet weak var lblSubtitle: CustomLabel!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var ivDisclosure: UIImageView!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ivIcon.tintColor = Color.primary.value
        ivDisclosure.tintColor = Color.primary.value
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
