//
//  ViewController.swift
//  exercise1
//
//  Created by day4 on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var fullname: UILabel!
    
    var activeTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullname.text = ""
        fullname.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    @IBAction func join(_ sender: UIButton) {
        if let firstnameText:String = firstname.text,
           let lastnameText:String = lastname.text {
            fullname.text = "\(firstnameText) \(lastnameText)"
        }
        
        if(activeTextField != nil) {
            activeTextField.resignFirstResponder()
        }
    }
}

