//
//  DetailTableViewController.swift
//  Project13
//
//  Created by solar on 4/2/16.
//  Copyright © 2016 Republic Polytechnic. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
  
  // MARK: - IBOutlet properties
  @IBOutlet weak var outLabelName: UILabel!
  @IBOutlet weak var outLabelContact: UILabel!
  @IBOutlet weak var outLabelPostalCode: UILabel!
  @IBOutlet weak var outLabelAddress: UILabel!
  
  // MARK: - properties
  var index = -1

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // get the data associated with the index
    let data = DataController.sharedInstance.get(index)
    // set the text for the labels
    outLabelName.text = data.name
    outLabelContact.text = data.contact
    outLabelPostalCode.text = data.postalCode
    outLabelAddress.text = data.address
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // get the next view controller
    let vc = segue.destination as! AddEditTableViewController
    // pass the index
    vc.index = index
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
