//
//  ViewControllerB.swift
//  Exercise 2
//
//  Created by day4 on 14/1/21.
//

import UIKit

class ViewControllerB: UIViewController {
    
    @IBOutlet weak var outLabel: UILabel!
    var word:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outLabel.text = word
    }
        
    @IBAction func actDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
