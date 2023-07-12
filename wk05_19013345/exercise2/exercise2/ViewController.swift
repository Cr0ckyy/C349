//
//  ViewController.swift
//  exercise2
//
//  Created by day4 on 19/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colors: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colors.setTitle("green", forSegmentAt: 0)
        colors.setTitle("orange", forSegmentAt: 1)
        colors.setTitle("red", forSegmentAt: 2)
        self.view.backgroundColor = UIColor.green
    }
    
    @IBAction func colorChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor.green
        } else if sender.selectedSegmentIndex == 1 {
            self.view.backgroundColor = UIColor.orange
        } else if sender.selectedSegmentIndex == 2 {
            self.view.backgroundColor = UIColor.red
        }
    }
}

