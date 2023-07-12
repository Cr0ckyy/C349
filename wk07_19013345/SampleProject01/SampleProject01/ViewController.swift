//
//  ViewController.swift
//  SampleProject01
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outTextField: UITextField!
    
    @objc let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .dateAndTime
        
        outTextField.inputView = picker
        outTextField.inputAccessoryView = createToolbar(action: #selector( pickerDone))
    }
    
    func createToolbar(action: Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
        toolbar.setItems([spacer, button], animated: false)
        toolbar.sizeToFit()
        
        return toolbar
    }
    
    @objc func pickerDone() {
        outTextField.resignFirstResponder()
        let date = picker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YY HH:mm"
        let strDate = dateFormatter.string(from: date)
        outTextField.text = strDate
        
    }
}

