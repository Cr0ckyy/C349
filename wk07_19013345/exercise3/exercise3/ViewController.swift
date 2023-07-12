//
//  ViewController.swift
//  exercise3
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heads: UILabel!
    @IBOutlet weak var tails: UILabel!
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toss(_ sender: UIButton) {
        let firstNum = Int.random(in: 1..<100)
        let secondNum = Int.random(in: 1..<100)
        heads.text = "\(firstNum)"
        tails.text = "\(secondNum)"
        if firstNum > secondNum {
            display.text = "Heads"
        } else {
            display.text = "Tails"
        }
    }
    
}

