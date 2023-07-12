//
//  ViewController.swift
//  exercise3
//
//  Created by day4 on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var choice: UISegmentedControl!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var actionMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        balance.text = "1000"
        header.font = UIFont.boldSystemFont(ofSize: 20)
        actionMessage.text = ""
    }

    @IBAction func depositOrWithdraw(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            button.setTitle("Deposit", for: .normal)
        } else {
            button.setTitle("Withdraw", for: .normal)
        }
    }
    @IBAction func action(_ sender: UIButton) {
        if let amountText = balance.text,
           let Amount = Double(amountText),
           let inputText = input.text,
           let Input = Double(inputText){
            var account = Bank(amount: Amount)
            
            if choice.selectedSegmentIndex == 0 {
                balance.text = account.deposit(amountInput: Input)
                actionMessage.text = "Balance updated. Deposited \(Input)"
            } else {
                let returned = account.withdraw(amountOutput: Input)
                if returned < 0 {
                    actionMessage.text = "Not enough money to perform withdrawal"
                } else {
                    balance.text = "\(returned)"
                    actionMessage.text = "Balanced updated. Withdrawed \(Input)"
                }
            }
            input.text = ""
        } else {
            actionMessage.text = "Please enter a number input"
        }
    }
    
}

