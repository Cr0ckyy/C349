//
//  ViewController.swift
//  SampleProject
//
//  Created by 19013345 Ju Long on 26/4/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var outLabel: UILabel!
    @IBOutlet weak var outTextField: UITextField!
    @IBOutlet weak var outPickerView: UIPickerView!
    
    var items: [String] = ["apple", "banana", "orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#file, #function, #line)
        outPickerView.delegate = self
        outPickerView.dataSource = self
    }
    
    func testFuction() {
        print("this is a test function")
    }

    @IBAction func actButton(_ sender: UIButton) {
        print(#file, #function, #line)
        outLabel.text = outTextField.text
        if let text = outTextField.text {
            if let num = Int(text) {
                if num < items.count {
                    let item = items[num]
                    outLabel.text = item
                }
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print(#file, #function, #line)
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(#file, #function, #line)
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(#file, #function, #line)
        return items[row]
    }
}

