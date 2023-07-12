//
//  VCB.swift
//  exercise1
//
//  Created by day4 on 7/1/21.
//

import UIKit

class VCB: UIViewController {

    @IBOutlet weak var outLabel: UILabel!
    @IBOutlet weak var Header: UILabel!
    
    var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Header.font = UIFont.boldSystemFont(ofSize: 20)
        outLabel.text = "You chose \(name!)"
    }
    
}
