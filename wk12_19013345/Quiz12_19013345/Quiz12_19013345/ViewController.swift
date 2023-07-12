//
//  ViewController.swift
//  Quiz12_19013345
//
//  Created by day4 on 4/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outTableView: UITableView!
    var numbers = [1, 2, 3, 4, 5]
    @IBOutlet weak var outText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outText.text = "minimum: \nmaximum: \ntotal: \naverage: \n"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "Hello"
        return cell
    }
}

