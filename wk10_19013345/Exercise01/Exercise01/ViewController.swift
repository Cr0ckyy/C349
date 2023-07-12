//
//  ViewController.swift
//  Exercise01
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {

    @IBOutlet weak var outPickerView: UIPickerView!
    var names = ["andy", "belinda", "charlie", "debolia", "ellis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outPickerView.dataSource = self
            outPickerView.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }
      
      func pickerView(_ pickerView: UIPickerView,
                      numberOfRowsInComponent component: Int) -> Int {
        return names.count
      }
      
      // Implement the UIPickerViewDelegate methods
      func pickerView(_ pickerView: UIPickerView,
                      titleForRow row: Int,
                      forComponent component: Int) -> String? {
        return names[row]
      }
    
    @IBAction func randomise(_ sender: UIButton) {
        let randomno = Int.random(in: 0..<names.count)
        outPickerView.selectRow(randomno, inComponent: 0, animated: true)
    }
}

