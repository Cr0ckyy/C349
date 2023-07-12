//
//  ViewController.swift
//  exercise1
//
//  Created by day4 on 19/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var textview1: UITextView!
    @IBOutlet weak var textview2: UITextView!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var textviewTotal: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper1.minimumValue = 1
        stepper1.maximumValue = 5
        stepper1.stepValue = 1
        stepper1.value = 1
        
        stepper2.minimumValue = 1
        stepper2.maximumValue = 10
        stepper2.stepValue = 1
        stepper2.value = 1
        
        textview1.text = "1.0"
        textview2.text = "1.0"
        
    }

    @IBAction func stepper1Value(_ sender: UIStepper) {
        textview1.text = "\(sender.value)"
    }
    
    @IBAction func stepper2Value(_ sender: UIStepper) {
        textview2.text = "\(sender.value)"
    }
    
    @IBAction func multiplyValue(_ sender: UIButton) {
        let value1 = stepper1.value
        let value2 = stepper2.value
        let total = value1 * value2
        textviewTotal.text = "\(total)"
    }
}

