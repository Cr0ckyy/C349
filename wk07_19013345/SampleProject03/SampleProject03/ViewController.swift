//
//  ViewController.swift
//  SampleProject03
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  @IBOutlet weak var outTextFieldFruits: UITextField!
  @IBOutlet weak var outTextFieldColors: UITextField!

  let fruitPicker = UIPickerView()
  let colorPicker = UIPickerView()

  var fruits = ["apple", "banana", "carrot"]
  var colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

  override func viewDidLoad() {
    super.viewDidLoad()

    fruitPicker.dataSource = self
    fruitPicker.delegate = self
    colorPicker.dataSource = self
    colorPicker.delegate = self

    outTextFieldFruits.inputView = fruitPicker
    outTextFieldFruits.inputAccessoryView = createToolbar(action:#selector(fruitPickerDone))
    outTextFieldColors.inputView = colorPicker
    outTextFieldColors.inputAccessoryView = createToolbar(action:#selector(colorPickerDone))
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    if (pickerView == fruitPicker) {
      return 1
    } else if (pickerView == colorPicker) {
      return 1
    }
    return 0
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if (pickerView == fruitPicker) {
      return fruits.count
    } else if (pickerView == colorPicker) {
      return colors.count
    }
    return 0
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if (pickerView == fruitPicker) {
      return fruits[row]
    } else if (pickerView == colorPicker) {
      return colors[row]
    }
    return nil
  }
  
  @objc func fruitPickerDone() {
    outTextFieldFruits.resignFirstResponder()
    
    let index = fruitPicker.selectedRow(inComponent: 0)
    var item = fruits[index]
    outTextFieldFruits.text = item
  }

  @objc func colorPickerDone() {
    outTextFieldColors.resignFirstResponder()
    
    let index = colorPicker.selectedRow(inComponent: 0)
    var item = colors[index]
    outTextFieldColors.text = item
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
