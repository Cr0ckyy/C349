//
//  AnotherViewController.swift
//  SampleProject2
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class AnotherViewController: UIViewController {

    @IBOutlet weak var outLabelA: UILabel!
    var value: Float! {
        didSet {
            outLabelA.text = "\(value!)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func outSliderA(_ sender: UISlider) {
        if let svc = self.splitViewController {
            let nc = svc.viewControllers[0] as! UINavigationController
            let dvc = nc.topViewController as! ViewController
            dvc.value = sender.value
        }
    }
}
