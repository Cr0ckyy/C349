//
//  ContactTableViewCell.swift
//  Project13
//
//  Created by solar on 4/2/16.
//  Copyright © 2016 Republic Polytechnic. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
  
  @IBOutlet weak var outLabelName: UILabel!
  @IBOutlet weak var outLabelMobile: UILabel!
  @IBOutlet weak var outLabelPostalCode: UILabel!
  @IBOutlet weak var outLabelAddress: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
