//
//  ViewController.swift
//  SampleProject03
//
//  Created by 19013345 Ju Long on 12/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let defaults = UserDefaults.standard
//
//        var myAppDefaults = [String: Any]()
//        myAppDefaults["scenario2"] = "scenario 2 register default value"
//        myAppDefaults["scenario4"] = "scenario 4 register default value"
//        defaults.register(defaults: myAppDefaults)
//
//        defaults.set("scenario 3 associated value", forKey: "scenario3")
//        defaults.set("scenario 4 associated value", forKey: "scenario4")
//
//        print("S1 \(defaults.string(forKey: "scenario1"))")
//        print("S2 \(defaults.string(forKey: "scenario2"))")
//        print("S3 \(defaults.string(forKey: "scenario3"))")
//        print("S4 \(defaults.string(forKey: "scenario4"))")
        
        let defaults = UserDefaults.standard
        
        var myAppDefaults = [String: Any]()
        myAppDefaults["currency"] = "SGD"
        myAppDefaults["backgroundColor"] = "red"
        defaults.register(defaults: myAppDefaults)
        
        print("Currency: \(defaults.string(forKey: "currency"))")
        print("Background Colour: \(defaults.string(forKey: "backgroundColor"))")
    }


}

