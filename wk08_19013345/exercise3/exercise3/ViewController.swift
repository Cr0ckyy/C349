//
//  ViewController.swift
//  exercise3
//
//  Created by day4 on 7/1/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {

    var grcs = ["Ang Mo Kio": ["Ang Mo Kio", "Yio Chu Kang", "Jalan Kayu"],
                "Bishan-Toa Payoh": ["Bishan", "Toa Payoh"]]
    @IBOutlet weak var outPickerView1: UIPickerView!
    @IBOutlet weak var outPickerView2: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPickerView1.dataSource = self
        outPickerView1.delegate = self
        outPickerView2.dataSource = self
        outPickerView2.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == outPickerView1) {
            return (grcs.keys).count
        } else {
            if (outPickerView1.selectedRow(inComponent: 0) == 0) {
                return (grcs["Ang Mo Kio"]!).count
            } else {
                return (grcs["Bishan-Toa Payoh"]!).count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if (pickerView == outPickerView1) {
            NSLog(Array(grcs.keys)[row])
            return (Array(grcs.keys)[row])
            
        } else {
            if (outPickerView1.selectedRow(inComponent: 0) == 0) {
                return (grcs["Ang Mo Kio"]![row])
            } else {
                return (grcs["Bishan-Toa Payoh"]![row])
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row:Int,
                    inComponent component: Int) {
        outPickerView2.reloadComponent(0)
        if (pickerView == outPickerView1 && component == 0) {
            outPickerView2.selectRow(0, inComponent: 0, animated: true)
        }
    }
}

