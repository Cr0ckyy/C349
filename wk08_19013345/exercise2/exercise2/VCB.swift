//
//  VCB.swift
//  exercise2
//
//  Created by day4 on 7/1/21.
//

import UIKit

class VCB: UIViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var input: UITextField!
    var data : data!

      override func viewDidLoad() {
        super.viewDidLoad()
        header.font = UIFont.boldSystemFont(ofSize: 20)
      }
    
    @IBAction func done(_ sender: UIButton) {
        data.name = "\(input.text!)"
    }
}
