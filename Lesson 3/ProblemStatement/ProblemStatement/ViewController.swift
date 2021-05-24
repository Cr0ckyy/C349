//
//  ViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outNameLabel: UILabel!
    @IBOutlet weak var outNumberLabel: UILabel!
    var user: User!
    var addEdit: AddEditProtocol!
    var test = AddEditProtocol.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ((user?.name) != nil) {
            if !user.name.isEmpty {
                outNameLabel.text = "Name: \(user.name)"
                outNumberLabel.text = "Number: \(user.number)"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        let vc = segue.destination as! AddEditViewController
        if identifier == "edit" {
            vc.user = user
        } else {
            vc.user = User(name: "", number: 0)
        }
        vc.addEdit = addEdit
    }

    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}

