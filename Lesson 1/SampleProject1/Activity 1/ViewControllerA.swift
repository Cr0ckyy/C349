//
//  ViewControllerA.swift
//  Activity 1
//
//  Created by 19013345 Ju Long on 19/4/21.
//

import UIKit

class ViewControllerA: UIViewController {
    
    @IBOutlet weak var outTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actButton(_ sender: UIButton) {
        performSegue(withIdentifier: "next", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifer = segue.identifier
        if identifer == "next" {
            let vc = segue.destination as! ViewControllerB
            let text = outTextField.text
            vc.text = text
        }
    }
}
