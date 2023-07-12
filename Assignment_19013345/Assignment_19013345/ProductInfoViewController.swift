//
//  ViewController.swift
//  Assignment_19013345
//
//  Created by day4 on 15/2/21.
//

import UIKit

class ProductInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var data = Product()
    var selected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        data.addProduct("Nike Free", "Blue", 120.99)
        data.addProduct("Apple iPhone 12", "Space Gray", 1089.00)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.productName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        // the cell identifier is case-sensitive and must match the
        // value entered using the Attributes Inspector for the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row = indexPath.row
        
        // display array item in the label
        if let label = cell.textLabel {
            label.text = "\(data.getProductName(row)), \(data.getProductColor(row))"
        }
        if let subLabel = cell.detailTextLabel {
            subLabel.text = "$\(data.getProductPrice(row))"
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailTableViewController
        // Set the property of the destination view controller
        if let indexPath = tableView.indexPathForSelectedRow {
            selected = indexPath
        }
        vc.data = data
        vc.selected = selected
      }
}

