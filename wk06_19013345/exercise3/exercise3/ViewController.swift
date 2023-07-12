//
//  ViewController.swift
//  exercise3
//
//  Created by day4 on 26/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outDatePicker: UIDatePicker!
    @IBOutlet weak var outLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outDatePicker.datePickerMode = .date
    }

    @IBAction func display(_ sender: UIButton) {
        let dateNow = Date()
        let date = outDatePicker.date
        
        let diffs = Calendar.current.dateComponents([.day], from: dateNow, to: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        
        let output = "\(dateFormatter.string(from: date)) is \(diffs.day! + 1) days away"
        
        outLabel.text = output
    }
    
}

