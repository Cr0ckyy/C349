//
//  ViewController.swift
//  SampleProject01
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
        do {
            let data = try encoder.encode(sampleData)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func readData() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("sample.plist")
        
        let decoder = PropertyListDecoder()
        do {
            let xml = try Data(contentsOf: url)
            
            let sampleData = try decoder.decode([String].self, from: xml)
            print(sampleData)
        } catch {
            print(error)
        }
    }
}

