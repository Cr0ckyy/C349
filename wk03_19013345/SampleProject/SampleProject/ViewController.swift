//
//  ViewController.swift
//  SampleProject
//
//  Created by day4 on 5/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var outWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outWeight.text = "Time for a break"
        slider.maximumValue = 10
        slider.minimumValue = 0
    }
    
    @IBAction func actSlider(_ sender: UISlider) {
        outWeight.text = "\(sender.value)"
    }
}

