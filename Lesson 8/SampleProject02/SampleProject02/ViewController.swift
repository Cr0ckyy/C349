//
//  ViewController.swift
//  SampleProject02
//
//  Created by 19013345 Ju Long on 12/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actLoad(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let booleanValue = defaults.bool(forKey: "booleanValue")
        let integerValue = defaults.integer(forKey: "integerValue")
        let doubleValue = defaults.double(forKey: "doubleValue")
        let stringValue = defaults.string(forKey: "stringValue") ?? "no value"
        
        print("booleanValue is \(booleanValue)")
        print("integerValue is \(integerValue)")
        print("doubleValue is \(doubleValue)")
        print("stringValue is \(stringValue)")
    }
    
    @IBAction func actSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        defaults.set(true, forKey: "booleanValue")
        defaults.set(12, forKey: "integerValue")
        defaults.set(34.56, forKey: "doubleValue")
        defaults.set("Hello World", forKey: "stringValue")
    }
}

