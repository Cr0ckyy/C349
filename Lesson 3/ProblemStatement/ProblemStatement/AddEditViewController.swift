//
//  AddEditViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class AddEditViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    var edit = false
    var user: User!
    var addEdit: AddEditProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if user?.name != nil {
            if !user.name.isEmpty {
                nameField.text = user.name
                numberField.text = "\(user.number)"
                edit = true
            } else {
                edit = false
            }
        }
    }
    
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        if let name = nameField.text, let numberText = numberField.text, let number = Int(numberText) {
            if edit {
                addEdit.Edit(name: name, number: number)
            } else {
                addEdit.Add(name: name, number: number)
            }
        }
        self.performSegue(withIdentifier: "unwind", sender: self)
    }
}
