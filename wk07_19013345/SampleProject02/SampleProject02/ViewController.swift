//
//  ViewController.swift
//  SampleProject02
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
    @IBOutlet weak var outTextFieldFruits: UITextField!
  
    let fruitPicker = UIPickerView()

    var fruits = ["apple", "banana", "carrot"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    fruitPicker.dataSource = self
    fruitPicker.delegate = self
    
    outTextFieldFruits.inputView = fruitPicker
    outTextFieldFruits.inputAccessoryView = createToolbar(action:#selector(fruitPickerDone))
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    if (pickerView == fruitPicker) {
      return 1
    }
    return 0
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if (pickerView == fruitPicker) {
      return fruits.count
    }
    return 0
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if (pickerView == fruitPicker) {
      return fruits[row]
    }
    return nil
  }
  
  @objc func fruitPickerDone() {
    outTextFieldFruits.resignFirstResponder()
    
    let index = fruitPicker.selectedRow(inComponent: 0)
    var item = fruits[index]
    outTextFieldFruits.text = item
  }

  func createToolbar(action:Selector) -> UIToolbar {
    let toolbar = UIToolbar()
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
    toolbar.setItems([spacer, button], animated: false)
    toolbar.sizeToFit()
    
    return toolbar
  }
}
