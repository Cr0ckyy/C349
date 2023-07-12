//
//  ViewControllerA.swift
//  Exercise 1
//
//  Created by day4 on 14/1/21.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toScreenB(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToB", sender: self)
    }
}
