//
//  SideBarTableViewCell.swift
//  the-giving-movement-assignment
//
//  Created by Sakib Kurtic on 2/20/23.
//

import UIKit

class SideBarTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupWith(optionLabel labelString: String) {
        titleLabel.text = labelString
    }
}
