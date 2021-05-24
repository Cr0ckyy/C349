//
//  ViewController.swift
//  SampleProject2
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outLabel: UILabel!
    var value: Float! {
        didSet {
            outLabel.text = "\(value!)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actSlider(_ sender: UISlider) {
        if let svc = self.splitViewController {
            let nc = svc.viewControllers[1] as! UINavigationController
            let dvc = nc .topViewController as! AnotherViewController
            dvc.value = sender.value
        }
    }
}

