//
//  ViewController.swift
//  Exercise02
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {

    @IBOutlet weak var outPickerView: UIPickerView!
    
    let dc = DataController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPickerView.delegate = self
        outPickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        outPickerView.reloadAllComponents()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }
      
      func pickerView(_ pickerView: UIPickerView,
                      numberOfRowsInComponent component: Int) -> Int {
        return dc.count
      }
      
      // Implement the UIPickerViewDelegate methods
      func pickerView(_ pickerView: UIPickerView,
                      titleForRow row: Int,
                      forComponent component: Int) -> String? {
        return dc.retrieve(row)
      }
    
    @IBAction func edit(_ sender: UIButton) {
        dc.select(outPickerView.selectedRow(inComponent: 0))
        outPickerView.reloadAllComponents()
        self.tabBarController?.selectedIndex = 1
    }
}

