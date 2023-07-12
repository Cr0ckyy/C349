//
//  VCC.swift
//  exercise4
//
//  Created by day4 on 7/1/21.
//

import UIKit

class VCC: UIViewController {

    var data:Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actShowAlert(_ sender: UIButton) {
        // create the UIAlertController object
        var alert:UIAlertController
        if (data.choice == "Add") {
            alert = UIAlertController(title: "Result",
                                          message: "\(data.firstNo) + \(data.secondNo) = \(data.firstNo + data.secondNo)",
                                          preferredStyle: .alert)
        } else if (data.choice == "Subtract") {
            alert = UIAlertController(title: "Result",
                                          message: "\(data.firstNo) - \(data.secondNo) = \(data.firstNo - data.secondNo)",
                                          preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: "Result",
                                          message: "\(data.firstNo) * \(data.secondNo) = \(data.firstNo * data.secondNo)",
                                          preferredStyle: .alert)
        }
        let doneAction = UIAlertAction(title: "Done",
                                       style: .default) { (action:UIAlertAction) in
                                        // code to be executed when button is pressed
                                        print("done button pressed")
        }
        alert.addAction(doneAction)
        
        present(alert, animated: true, completion: nil)
      }
    
}
