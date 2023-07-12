//
//  LoginViewController.swift
//  Quiz_19013345
//
//  Created by day4 on 21/1/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        if let usernameText = username.text,
           let passwordText = password.text {
            if usernameText == "abc" && passwordText == "abc" {
                username.text = ""
                password.text = ""
                performSegue(withIdentifier: "success", sender: self)
            } else {
                username.text = ""
                password.text = ""
                performSegue(withIdentifier: "failure", sender: self)
            }
        }
    }
    
    @IBAction func unwindMethod(_ segue: UIStoryboardSegue) {
    }
}
