//
//  ViewController.swift
//  Exercise05
//
//  Created by 19013345 Ju Long on 12/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    let colours: [UIColor] = [UIColor.red, UIColor.green, UIColor.yellow]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        retrievePreference()
    }

    func retrievePreference() {
        let defaults = UserDefaults.standard
        
        let colour = defaults.integer(forKey: "background_color_identifier")
        print("\(colour)")
        self.view.backgroundColor = colours[colour]
    }
}

