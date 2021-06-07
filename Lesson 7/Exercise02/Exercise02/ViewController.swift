//
//  ViewController.swift
//  Exercise02
//
//  Created by 19013345 Ju Long on 7/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outPicker: UIPickerView!
    var items: [String] = ["apple", "banana", "orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outPicker.delegate = self
        outPicker.dataSource = self
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
}

