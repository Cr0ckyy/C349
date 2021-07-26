//
//  ViewController.swift
//  SampleProject04
//
//  Created by 19013345 Ju Long on 19/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = Bundle.main.url(forResource: "myPlist01", withExtension: "plist") {
            let decoder = PropertyListDecoder()
            do {
                let xml = try Data(contentsOf: url)
                let plistData = try decoder.decode([String: String].self, from: xml)
                print(plistData)
            } catch {
                print(error)
            }
        }
        
        if let url = Bundle.main.url(forResource: "myPlist02", withExtension: "plist") {
            let decoder = PropertyListDecoder()
            do {
                let xml = try Data(contentsOf: url)
                let plistData = try decoder.decode([String].self, from: xml)
                print(plistData)
            } catch {
                print(error)
            }
        }
    }


}

