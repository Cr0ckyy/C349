//
//  ViewController.swift
//  exercise2
//
//  Created by day4 on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outFirst: UITextField!
    @IBOutlet weak var outSecond: UITextField!
    @IBOutlet weak var outResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outResult.text = ""
    }

    @IBAction func actCheck(_ sender: UIButton) {
        if let firstnumText = outFirst.text,
        let secondnumText = outSecond.text,
        let firstnum = Int(firstnumText),
        let secondnum = Int(secondnumText) {
         let remainderAmount = firstnum % secondnum
            if remainderAmount == 0 {
                outResult.text = "There is no remainder"
            } else {
                outResult.text = "The remainder is \(remainderAmount)"
            }
        } else {
            outResult.text = "error input"
        }
    }
}

