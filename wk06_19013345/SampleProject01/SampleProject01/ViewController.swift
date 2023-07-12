//
//  ViewController.swift
//  SampleProject01
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
        outDatePicker.datePickerMode = .dateAndTime
    }
    @IBAction func actButton(_ sender: UIButton) {
        let date = outDatePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY HH:mm"
        
        let strDate = dateFormatter.string(from: date)
        outLabel.text = "\(strDate)"
    }
    

}

