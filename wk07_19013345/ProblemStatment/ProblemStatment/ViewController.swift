//
//  ViewController.swift
//  ProblemStatment
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var mobileInput: UITextField!
    @IBOutlet weak var datePicker: UITextField!
    @IBOutlet weak var subPicker: UITextField!
    @IBOutlet weak var breadPicker: UITextField!
    @IBOutlet weak var saucePicker: UITextField!
    @IBOutlet weak var display: UITextView!
    
    let date = UIDatePicker()
    let sub = UIPickerView()
    let bread = UIPickerView()
    let sauce = UIPickerView()
    
    let subList = ["B.L.T", "B.L.T. with Avocado", "Bacon, Egg & Cheese", "Bacon, Egg & Cheese with Avocado", "Black Forest Ham", "Breakfast B.M.T.® Melt", "Buffalo Chicken", "Chicken & Bacon Ranch Melt", "Chipotle Steak & Cheese with Avocado", "Cold Cut Combo", "Egg & Cheese", "Egg White & Cheese with Avocado", "Italian B.M.T.®", "Meatball Marinara", "Oven Roasted Chicken", "Roast Beef", "Spicy Italian", "Steak & Cheese", "Steak, Egg & Cheese", "Subway Club®", "Subway Club® with Avocado", "Subway Melt®", "Sunrise Subway Melt™", "Sweet Onion Chicken Teriyaki", "The Big Philly Cheesesteak", "Tuna", "Turkey & Bacon Avocado", "Turkey & Spinach with Avocado", "Turkey Breast", "Turkey Breast & Black Forest Ham"]
    
    let breadList = ["Italian", "Wheat", "Parmesan Oregano", "Honey Oat", "Hearty Italian"]
    
    let sauceList = ["Mustard", "Sweet Onion", "Honey Mustard", "Vinegar", "Chipotle Southwest", "Mayonnaise", "Oil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 232/255.0, green: 186/255.0, blue: 21/255.0, alpha: 1)
        
        date.preferredDatePickerStyle = .wheels
        datePicker.inputView = date
        datePicker.inputAccessoryView = createToolbar(action: #selector(pickerDone))
        
        sub.dataSource = self
        sub.delegate = self
        bread.dataSource = self
        bread.delegate = self
        sauce.dataSource = self
        sauce.delegate = self
        
        subPicker.inputView = sub
        subPicker.inputAccessoryView = createToolbar(action:#selector(subPickerDone))
        breadPicker.inputView = bread
        breadPicker.inputAccessoryView = createToolbar(action:#selector(breadPickerDone))
        saucePicker.inputView = sauce
        saucePicker.inputAccessoryView = createToolbar(action:#selector(saucePickerDone))
        
        date.minimumDate = Calendar.current.date(byAdding: .hour, value: 1,  to: Date())
        date.maximumDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())
        
        nameInput.backgroundColor = UIColor.white
        mobileInput.backgroundColor = UIColor.white
        datePicker.backgroundColor = UIColor.white
        subPicker.backgroundColor = UIColor.white
        breadPicker.backgroundColor = UIColor.white
        saucePicker.backgroundColor = UIColor.white
        
        let message = "Name: \nMobile: \nDate: \nSub: \nBread: \nSauce:"
        display.text = message
        
        nameInput.addTarget(self, action: #selector(show(textField:)), for: .editingChanged)
        mobileInput.addTarget(self, action: #selector(show(textField:)), for: .editingChanged)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == sub) {
            return 1
        } else if (pickerView == bread) {
            return 1
        } else {
            return 1
        }
      }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == sub {
            return subList.count
        } else if pickerView == bread {
            return breadList.count
        } else {
            return sauceList.count
        }
      }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == sub) {
            return subList[row]
        } else if (pickerView == bread) {
            return breadList[row]
        } else {
            return sauceList[row]
        }
      }
    
    @objc func subPickerDone() {
        subPicker.resignFirstResponder()
        let item = subList[sub.selectedRow(inComponent: 0)]
        subPicker.text = item
        show(textField: subPicker)
    }
    
    @objc func breadPickerDone() {
        breadPicker.resignFirstResponder()
        let item = breadList[bread.selectedRow(inComponent: 0)]
        breadPicker.text = item
        show(textField: breadPicker)
    }
    
    @objc func saucePickerDone() {
        saucePicker.resignFirstResponder()
        let item = sauceList[sauce.selectedRow(inComponent: 0)]
        saucePicker.text = item
        show(textField: saucePicker)
    }
    
    @objc func pickerDone() {
        date.resignFirstResponder()
        
        let currDate = date.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY HH:mm"
        
        let strDate = dateFormatter.string(from: currDate)
        datePicker.text = strDate
        show(textField: datePicker)
    }
    
    func createToolbar(action:Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
        toolbar.setItems([spacer, button], animated: true)
        toolbar.sizeToFit()
        
        return toolbar
      }
    
    @objc func show(textField: UITextField) {
        var n1 = ""
        var n2 = ""
        var n3 = ""
        var n4 = ""
        var n5 = ""
        var n6 = ""
        if let name = nameInput.text {
            n1 = name
        }
        if let mobile = mobileInput.text {
            n2 = mobile
        }
        if let date = datePicker.text {
            n3 = date
        }
        if let subInput = subPicker.text {
            n4 = subInput
        }
        if let breadInput = breadPicker.text {
            n5 = breadInput
        }
        if let sauceInput = saucePicker.text {
            n6 = sauceInput
        }
        
        display.text = "Name: \(n1)\nMobile: \(n2)\nDate: \(n3)\nSub: \(n4)\nBread: \(n5)\nSauce: \(n6)"
    }
    
    @IBAction func reset(_ sender: UIButton) {
        nameInput.text = ""
        mobileInput.text = ""
        datePicker.text = ""
        subPicker.text = ""
        breadPicker.text = ""
        saucePicker.text = ""
        let message = "Name: \nMobile: \nDate: \nSub: \nBread: \nSauce:"
        display.text = message
    }
}

