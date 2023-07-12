//
//  ViewControllerX.swift
//  Exercise02
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewControllerX: UIViewController {
    
    let dc = DataController.sharedInstance
    @IBOutlet weak var outTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outTextField.text = dc.retrieve(dc.getSelect())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        outTextField.text = dc.retrieve(dc.getSelect())
    }
    
    @IBAction func save(_ sender: UIButton) {
        if dc.getSelect() < 0 {
            dc.add(outTextField.text!)
        } else {
            dc.edit(dc.getSelect(), outTextField.text!)
        }
        outTextField.text = ""
        dc.select(-1)
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dc.select(-1)
        self.tabBarController?.selectedIndex = 0
    }
}
