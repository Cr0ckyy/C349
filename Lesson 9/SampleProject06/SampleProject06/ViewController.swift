//
//  ViewController.swift
//  SampleProject06
//
//  Created by 19013345 Ju Long on 19/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func writeData() {
        let myData = MyData()
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.plist")
        print(url)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(myData)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func readData() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.plist")
        let decoder = PropertyListDecoder()
        
        do {
            let xml = try Data(contentsOf: url)
            let myData = try decoder.decode(MyData.self, from: xml)
            
            print(myData.anInt)
            print(myData.aString)
        } catch {
            print(error)
        }
    }
}

