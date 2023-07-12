//
//  ViewController.swift
//  exercise2
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {
    
    @IBOutlet weak var outPicker: UIPickerView!
    @IBOutlet var header: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var display: UILabel!
    
    var discountList = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outPicker.dataSource = self
        outPicker.delegate = self
        header.font = UIFont.boldSystemFont(ofSize: 37)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return discountList.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return "\(discountList[row])%"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if let nText = input.text,
           let n = Double(nText){
            let discount = Double(discountList[outPicker.selectedRow(inComponent: 0)])
            let output = n - (n * (discount / 100))
            display.text = "Discounted amount is $\(output)"
        }
    }
}

