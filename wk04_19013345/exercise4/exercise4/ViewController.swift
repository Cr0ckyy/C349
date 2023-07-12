//
//  ViewController.swift
//  exercise4
//
//  Created by day4 on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        output.text = ""
    }

    @IBAction func Output(_ sender: UIButton) {
        if let valueText:String = input.text,
           let value = Double(valueText) {
            let tax = Tax(income: value)
            output.text = tax.calc()
        } else {
            output.text = "Error"
        }
    }
}

