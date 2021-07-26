//
//  TableViewController.swift
//  Exercise02
//
//  Created by 19013345 Ju Long on 19/7/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var items: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "dict", withExtension: "plist")
        let storedurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("myData.plist")
        print(storedurl)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let decoder = PropertyListDecoder()
        do {
            let xml = try Data(contentsOf: url!)
            items = try decoder.decode([String: String].self, from: xml)
            let data = try encoder.encode(items)
            try data.write(to: storedurl)
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let itemkey = Array(items.keys.sorted())[indexPath.row]
        let item = items[itemkey]
        
        if let title = cell.textLabel,
           let subtitle = cell.detailTextLabel {
            title.text = itemkey
            subtitle.text = item
        }
        return cell
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
