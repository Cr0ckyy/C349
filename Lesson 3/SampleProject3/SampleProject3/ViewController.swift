//
//  ViewController.swift
//  SampleProject3
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outTextField: UITextField!
    @IBOutlet weak var outLabel: UILabel!
    
    var text: String = "" {
        didSet {
            outLabel.text = text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actButton(_ sender: UIButton) {
        text = outTextField.text!
    }
}

