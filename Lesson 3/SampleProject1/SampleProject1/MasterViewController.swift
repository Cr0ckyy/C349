//
//  MasterViewController.swift
//  SampleProject1
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class MasterViewController: UITableViewController, MyProtocol {
    
    var titles = ["Military Defense", "Civil Defense", "Economic Defense", "Social Defense", "Psychological Defense"]
    var selectedRow: IndexPath = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#file) \(#function) \(#line)")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        let title = titles[row]
        
        if let label = cell.textLabel {
            label.text = title
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let row = indexPath.row
            selectedRow = indexPath
            let title = titles[row]
            let nc = segue.destination as! UINavigationController
            let vc = nc.topViewController as! DetailViewController
            vc.stringData = title
            vc.delegate = self
        }
    }

    func shuffle() {
        titles.shuffle()
        tableView.reloadData()
        tableView.selectRow(at: selectedRow, animated: false, scrollPosition: .middle)
        performSegue(withIdentifier: "one", sender: Any?.self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
