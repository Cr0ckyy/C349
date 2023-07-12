//
//  ViewController.swift
//  exercise2(harder)
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
    @IBOutlet weak var random: UIButton!
    
    // Declare an array of data to be shown in the first component
    var firstName = ["Tom", "Dick", "Harry"]
    
    // Declare an array of data to be shown in the second component
    var lastName = ["Smith", "Charles", "Pearson", "Ken", "Miller"]
    
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
            return firstName.count
        } else {
            return lastName.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if (component == 0) {
            return firstName[row]
        } else {
            return lastName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row:Int,
                    inComponent component: Int) {
        let first = firstName[outPickerView.selectedRow(inComponent: 0)]
        let last = lastName[outPickerView.selectedRow(inComponent: 1)]
        
        outLabel.text = "\(first) \(last)"
    }
    
    @IBAction func randomise(_ sender: UIButton) {
        let i1 = Int.random(in: 0...firstName.count)
        let i2 = Int.random(in: 0...lastName.count)
        
        outPickerView.selectRow(i1, inComponent: 0, animated: true)
        outPickerView.selectRow(i2, inComponent: 1, animated: true)
        
        let first = firstName[outPickerView.selectedRow(inComponent: 0)]
        let last = lastName[outPickerView.selectedRow(inComponent: 1)]
        
        outLabel.text = "\(first) \(last)"
    }
}

