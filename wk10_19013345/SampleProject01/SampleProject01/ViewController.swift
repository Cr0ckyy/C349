//
//  ViewController.swift
//  SampleProject01
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outTextField: UITextField!

      let dc = DataController.sharedInstance
      
      override func viewDidLoad() {
        super.viewDidLoad()
        print(#file, #function)
      }

      override func viewWillAppear(_ animated: Bool) {
        print(#file, #function)
      }
      
      @IBAction func actAdd(_ sender: UIButton) {
        outTextField.resignFirstResponder()
        dc.add(item: outTextField.text!)
      }

}

