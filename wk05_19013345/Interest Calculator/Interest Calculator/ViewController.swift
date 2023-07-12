//
//  ViewController.swift
//  Interest Calculator
//
//  Created by day4 on 19/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var interestType: UISegmentedControl!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var yearIncrement: UIStepper!
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yearIncrement.minimumValue = 1
        yearIncrement.maximumValue = 200
        yearIncrement.stepValue = 1
        yearIncrement.value = 1
        
        year.text = "Year: \(Int(yearIncrement.value))"
        
        input.placeholder = "Amount"
        rate.placeholder = "Rate"
    }

    @IBAction func yearIncrementAction(_ sender: UIStepper) {
        year.text = "Year: \(Int(sender.value))"
        display()
    }
    
    @IBAction func `switch`(_ sender: UISegmentedControl) {
        info.text = ""
        total.text = "Total: $0"
        display()
    }
    
    func display() {
        var message = ""
        var totalValue = 0.0
        let years = Int(yearIncrement.value)
        if let inputText:String = input.text,
           let inputValue = Double(inputText),
           let rateText:String = rate.text,
           let rateValue = Double(rateText){
            if interestType.selectedSegmentIndex == 0 {
                message += "Simple Interest\n Starting Principle: $\(inputValue)\n\n"
                let interestEarned = inputValue * (rateValue / 100)
                totalValue += inputValue
                for index in 1...years {
                    totalValue += interestEarned
                    message += "Year \(index): \nInterest Earned - $\(interestEarned) \nPrinciple Increased - $\(totalValue)\n\n"
                }
            } else if interestType.selectedSegmentIndex == 1 {
                message += "Compound Interest\n Starting Principle: $\(inputValue)\n\n"
                totalValue += inputValue
                for index in 1...years {
                    let interestEarned = totalValue * (rateValue / 100)
                    totalValue += interestEarned
                    message += "Year \(index): \nInterest Earned - $\(return2dp(value: interestEarned)) \nPrinciple Increased - $\(return2dp(value: totalValue))\n\n"
                }
            }
        }
        info.text = message
        total.text = "Total: $\(return2dp(value: (totalValue)))"
    }
    
    func return2dp(value:Double) -> Double {
        return round(value * 100) / 100
    }
}

