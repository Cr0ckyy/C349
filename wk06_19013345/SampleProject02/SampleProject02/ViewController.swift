//
//  ViewController.swift
//  SampleProject02
//
//  Created by day4 on 26/11/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var outPickerView: UIPickerView!
    
    var fruits = ["apple", "banana", "carrot"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outPickerView.dataSource = self
        outPickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return fruits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,forComponent component: Int) -> String? {
      return fruits[row]
    }


}

