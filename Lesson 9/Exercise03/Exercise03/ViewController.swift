//
//  ViewController.swift
//  Exercise03
//
//  Created by 19013345 Ju Long on 19/7/21.
//

import UIKit
import Foundation

struct MyData: Codable {
    var gadgets: [String]
    var name: String
    var age: Int
    
    init(name: String, age: Int, gadgets: [String]) {
        self.name = name
        self.age = age
        self.gadgets = gadgets
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outTextField: UITextField!
    @IBOutlet weak var outSlider: UISlider!
    @IBOutlet weak var tableView: UITableView!
    var gadget: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "appdata", withExtension: "plist")
        let decoder = PropertyListDecoder()
        do {
            let xml = try Data(contentsOf: url!)
            let decodedData = try decoder.decode(MyData.self, from: xml)
            outTextField.text = decodedData.name
            outSlider.value = Float(decodedData.age)
            gadget = decodedData.gadgets
        } catch {
            print(error)
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gadget.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let label = cell.textLabel{
            label.text = gadget[indexPath.row]
        }
        
        return cell
    }
}
