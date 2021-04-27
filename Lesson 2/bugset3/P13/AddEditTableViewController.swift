//
//  AddEditTableViewController.swift
//  Project13
//
//  Created by solar on 4/2/16.
//  Copyright © 2016 Republic Polytechnic. All rights reserved.
//

import UIKit

class AddEditTableViewController: UITableViewController {
  // MARK: - IBOutlet properties
  @IBOutlet weak var outTextFieldName: UITextField!
  @IBOutlet weak var outTextFieldContact: UITextField!
  @IBOutlet weak var outTextFieldPostalCode: UITextField!
  @IBOutlet weak var outTextFieldAddress: UITextField!
  
  // MARK: - properties
  var index = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    // an index of -1 means we are in add mode
    if (index != -1) {
      // index is not -1 means we are in edit mode
      // get the contact associated with the index
      let data = DataController.sharedInstance.get(index)
      // set the text for the text fields
      outTextFieldContact.text = data.contact
      outTextFieldName.text = data.name
      outTextFieldPostalCode.text = data.postalCode
      outTextFieldAddress.text = data.address
    }
  }
    // MARK: - IBAction methods
    @IBAction func actSave(_ sender: UIBarButtonItem) {
        if (index == -1) {
          // an index of -1 means we are in add mode
          // create a new Data object with the text field values
          let data = ContactData(name: outTextFieldName.text!, contact: outTextFieldContact.text!, postalCode: outTextFieldPostalCode.text!, address: outTextFieldAddress.text!)
          // add to DataController
          DataController.sharedInstance.add(data)
        } else {
          // index is not -1 means we are in edit mode
          // get the contact associated with the index
          let data = DataController.sharedInstance.get(index)
          // update the properties with the text field values
          data.name = outTextFieldName.text!
          data.contact = outTextFieldContact.text!
          data.postalCode = outTextFieldPostalCode.text!
          data.address = outTextFieldAddress.text!
        }
        // return to previous view controller
        navigationController?.popViewController(animated: true)
    }
  
  // MARK: - Table view data source
  
  /*
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
  
  // Configure the cell...
  
  return cell
  }
  */
  
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
