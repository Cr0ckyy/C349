//
//  AddViewController.swift
//  SampleProject2
//
//  Created by 19013345 Ju Long on 19/4/21.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var outTextField: UITextField!
    var delegate: FruitDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actAdd(_ sender: UIButton) {
        if let text = outTextField.text {
            let dc = DataController.sharedInstance
            dc.addItem(item: text)
            delegate.itemAdded()
        }
    }
}
