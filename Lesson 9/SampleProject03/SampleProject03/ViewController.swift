//
//  ViewController.swift
//  SampleProject03
//
//  Created by 19013345 Ju Long on 19/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
        
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("colors.plist")
        print(url)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(colors)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }


}

