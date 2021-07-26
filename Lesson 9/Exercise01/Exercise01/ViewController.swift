//
//  ViewController.swift
//  Exercise01
//
//  Created by 19013345 Ju Long on 19/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        writeData()
        readData()
    }
    
    func writeData() {
        let sampleData = ["a", "b", "c"]
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("sample.plist")
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try? encoder.encode(sampleData)
        if data != nil {
            try? data?.write(to: url)
        }
    }
    
    func readData() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("sample.plist")
        
        let decoder = PropertyListDecoder()
        let xml = try? Data(contentsOf: url)
        
        if xml != nil {
            let sampleData = try? decoder.decode([String].self, from: xml!)
            print(sampleData)
        }
    }
}

