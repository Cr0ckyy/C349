//
//  TableViewCell.swift
//  Activity05
//
//  Created by 19013345 Ju Long on 24/5/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var outImageView: UIImageView!
    @IBOutlet weak var outTitleLabel: UILabel!
    @IBOutlet weak var outDetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
