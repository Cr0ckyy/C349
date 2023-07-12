//
//  ViewController.swift
//  practise1
//
//  Created by day4 on 26/11/20.
//

import UIKit
// Declare that ViewController conforms to the UIPickerViewDataSource
// and UIPickerViewDelegate protocol
class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {
    @IBOutlet weak var outPickerView: UIPickerView!
    @IBOutlet weak var outLabel: UILabel!
    
    // Declare an array of data to be shown in the first component
    var gender = ["boys", "girls"]
    
    // Declare an array of data to be shown in the second component
    var boys = ["tom", "dick", "harry"]
    var girls = ["jen", "May", "tif"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Attach an instance of the delegate class to the delegating class.
        // In this case, the delegate class is ViewController and the
        // delegating class is UIPickerView. The attachment is done via
        // the dataSource and delegate property in UIPickerView.
        outPickerView.dataSource = self
        outPickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return gender.count
        } else {
            if (outPickerView.selectedRow(inComponent: 0) == 0) {
                return boys.count
            } else {
                return girls.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if (component == 0) {
            return gender[row]
        } else {
            if (outPickerView.selectedRow(inComponent: 0) == 0) {
                return boys[row]
            } else {
                return girls[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row:Int,
                    inComponent component: Int) {
        outPickerView.reloadComponent(1)
        if (component == 0) {
            outPickerView.selectRow(0, inComponent: 1, animated: true)
        }
        let gen = gender[outPickerView.selectedRow(inComponent: 0)]
        var gend = ""
        if (outPickerView.selectedRow(inComponent: 0) == 0) {
            gend = boys[outPickerView.selectedRow(inComponent: 1)]
        } else {
            gend = girls[outPickerView.selectedRow(inComponent: 1)]
        }
        
        outLabel.text = "\(gen): \(gend)"
    }
    
}



