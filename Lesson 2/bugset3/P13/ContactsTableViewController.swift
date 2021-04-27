//
//  ContactsTableViewController.swift
//  Project11
//
//  Created by solar on 23/1/16.
//  Copyright © 2016 Republic Polytechnic. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }

  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return DataController.sharedInstance.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactTableViewCell
    
    let row = indexPath.row
    let data = DataController.sharedInstance.get(row)
    cell.outLabelName.text = data.name
    cell.outLabelMobile.text = data.contact
    cell.outLabelPostalCode.text = data.postalCode
    cell.outLabelAddress.text = data.address
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let identifier = segue.identifier
    if (identifier == "detail") {
      let vc = segue.destination as! DetailTableViewController
      // get the selected index path
      if let indexPath = tableView.indexPathForSelectedRow {
        // share the index of the selected cell
        vc.index = indexPath.row
      }
    } else if (identifier == "add") {
        let vc = segue.destination as! AddEditTableViewController
        vc.index = -1
    }
  }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
