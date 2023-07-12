//
//  ViewController.swift
//  SampleProject07
//
//  Created by day4 on 26/11/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var outPickerView: UIPickerView!
    @IBOutlet weak var outTextField: UITextField!

    var items : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        outPickerView.dataSource = self
        outPickerView.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }

    @IBAction func actAdd(_ sender: UIButton) {
        if let text = outTextField.text {
            items.append(text)
            outPickerView.reloadAllComponents()
        }
    }
}
