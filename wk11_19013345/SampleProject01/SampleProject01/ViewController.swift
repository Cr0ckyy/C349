//
//  ViewController.swift
//  SampleProject01
//
//  Created by day4 on 28/1/21.
//
import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var outTextField: UITextField!
  
  // array to hold the items to display in the table view
  var items : [String] = ["apple", "banana", "carrot"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  @IBAction func actAdd(_ sender: UIButton) {
    // add the text in the text field to the array
    items.append(outTextField.text!)
    // clear the text field
    outTextField.text = ""
    // reload the table view
    tableView.reloadData()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // number of rows is same as number of items in array
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let row = indexPath.row
      
      // display array item in the label
      if let label = cell.textLabel {
        label.text = items[row]
      }
      return cell
  }
}
