//
//  ViewController.swift
//  SampleProject04
//
//  Created by 19013345 Ju Long on 12/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outLabelName: UILabel!
    @IBOutlet weak var outLabelEnable: UILabel!
    @IBOutlet weak var outLabelSlider: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(self.settingsChanged(_:)), name: UserDefaults.didChangeNotification, object: nil)
        
        retrievePreference()
    }

    func retrievePreference() {
        let defaults = UserDefaults.standard
        
        let name = defaults.string(forKey: "name_preference") ?? "no value"
        let enabled = defaults.bool(forKey: "enabled_preference")
        let slider = defaults.double(forKey: "slider_preference")
        
        outLabelName.text = "\(name)"
        outLabelEnable.text = "\(enabled)"
        outLabelSlider.text = "\(slider)"
    }
    
    @objc func settingsChanged(_ notification: NSNotification) {
        retrievePreference()
    }
}

