//
//  EditViewController.swift
//  Assignment_19013345
//
//  Created by day4 on 28/1/21.
//

import UIKit

class EditViewController: UIViewController, UIPickerViewDataSource,
                          UIPickerViewDelegate {
    
    var data: DataController!

    @IBOutlet weak var outPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var outName: UITextField!
    @IBOutlet weak var outAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outName.placeholder = "Name"
        outAddress.placeholder = "Address"
        datePicker.minimumDate = Date()
        outPicker.dataSource = self
        outPicker.delegate = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }
      
      func pickerView(_ pickerView: UIPickerView,
                      numberOfRowsInComponent component: Int) -> Int {
        return data.colors.count
      }
      
      func pickerView(_ pickerView: UIPickerView,
                      titleForRow row: Int,
                      forComponent component: Int) -> String? {
        return data.colors[row]
      }
    
    @IBAction func checkPostal(_ sender: UITextField) {
        if sender.text?.count == 6,
           let num:Int = Int(sender.text!){
        }
    }
    @IBAction func save(_ sender: UIButton) {
        data.name = outName.text!
        data.address = outAddress.text!
        data.color = data.colors[outPicker.selectedRow(inComponent: 0)]
        data.date = datePicker.date
        performSegue(withIdentifier:
            "unwind", sender: self)
    }
}
