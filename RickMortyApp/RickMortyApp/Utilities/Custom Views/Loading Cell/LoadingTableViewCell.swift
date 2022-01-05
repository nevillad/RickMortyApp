//
//  LoadingTableViewCell.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import UIKit


let LOADING_TABLEVIEW_CELL_ID = "LoadingTableViewCell"
class LoadingTableViewCell: UITableViewCell {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var lblTitle: CustomLabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    private func configure() {
        self.activityIndicator.style = .medium
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.startAnimating()
        self.lblTitle.sizeToFit()
    }

}
