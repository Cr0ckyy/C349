//
//  TableViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class TableViewController: UITableViewController, AddEditProtocol {
    
    var UserData: [User] = [User(name: "Mike Hunt", number: 12345678), User(name: "Ben Dover", number: 87654321), User(name: "Nick Gurh", number: 23456789), User(name: "Mike Coxlong", number: 98765432)]
    var selected: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        performSegue(withIdentifier: "send", sender: self)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        let user = UserData[row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = "\(user.number)"
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            UserData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        UserData.swapAt(fromIndexPath.row, to.row)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nc = segue.destination as! UINavigationController
        let vc = nc.topViewController as! ViewController
        vc.addEdit = self
        if let indexPath = tableView.indexPathForSelectedRow {
            selected = indexPath
            let row = indexPath.row
            vc.user = UserData[row]
        } else {
            vc.user = User(name: "", number: 0)
        }
    }
    
    func Add(name: String, number: Int) {
        UserData.append(User(name: name, number: number))
        tableView.reloadData()
        tableView.selectRow(at: tableView.lastIndexPath(), animated: false, scrollPosition: .top)
        performSegue(withIdentifier: "send", sender: self)
    }
    
    func Edit(name: String, number: Int) {
        UserData[selected.row].name = name
        UserData[selected.row].number = number
        tableView.reloadData()
        tableView.selectRow(at: selected, animated: false, scrollPosition: .top)
        performSegue(withIdentifier: "send", sender: self)
    }
}

extension UITableView {
    func lastIndexPath() -> IndexPath {
        let section = max(numberOfSections - 1, 0)
        let row = max(numberOfRows(inSection: section) - 1, 0)
        
        return IndexPath(row: row, section: section)
    }
}
