//
//  ViewController.swift
//  exercise1
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {

    @IBOutlet weak var outPicker: UIPickerView!
    @IBOutlet weak var outLabel: UILabel!
    
    var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outPicker.dataSource = self
        outPicker.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return list.count
        } else {
            return list.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if (component == 0) {
            return "\(list[row])"
        } else {
            return "\(list[row])"
        }
    }
    
    
    @IBAction func outButton(_ sender: UIButton) {
        let firstNum = list[outPicker.selectedRow(inComponent: 0)] * 10
        let secondNum = list[outPicker.selectedRow(inComponent: 1)]
        let total = firstNum + secondNum
        if total % 17 == 0 {
            outLabel.text = "Unlocked"
        } else {
            outLabel.text = "Locked"
        }
    }
    
}

