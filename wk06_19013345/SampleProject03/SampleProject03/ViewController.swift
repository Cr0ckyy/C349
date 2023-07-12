//
//  ViewController.swift
//  SampleProject03
//
//  Created by day4 on 26/11/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
UIPickerViewDelegate {
    @IBOutlet weak var outPickerView: UIPickerView!
    @IBOutlet var outLabelFruits: UILabel!
    @IBOutlet weak var outLabelColors: UILabel!
    @IBOutlet weak var outStatus: UILabel!
    
    var fruits = ["apple", "banana", "carrot"]
    var colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

    override func viewDidLoad() {
        super.viewDidLoad()
        outPickerView.dataSource = self
        outPickerView.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return fruits.count
        } else {
            return colors.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return fruits[row]
        } else {
            return colors[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var itemFruit = outLabelFruits.text
        var itemColor = outLabelColors.text
        if (component == 0) {
            itemFruit = fruits[row]
        } else {
            itemColor = colors[row]
        }
        outLabelFruits.text = itemFruit
        outLabelColors.text = itemColor
    }
    
    @IBAction func actShowSelection(_ sender: UIButton) {
        var item0 = fruits[outPickerView.selectedRow(inComponent: 0)]
        var item1 = colors[outPickerView.selectedRow(inComponent: 1)]
        outLabelFruits.text = "\(item0)"
        outLabelColors.text = "\(item1)"
        outStatus.text = "\(item0) \(item1)"
    }
    
    @IBAction func actReset(_ sender: UIButton) {
        outPickerView.selectRow(0, inComponent: 0, animated: true)
        outPickerView.selectRow(0, inComponent: 1, animated: true)
    }
}

