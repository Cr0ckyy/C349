import UIKit
class TableViewController: UITableViewController {
  
  // array to hold the items to display in the table view
  var items : [String] = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // number of rows is same as number of items in array
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let row = indexPath.row
      
      // display array item in the label
      if let label = cell.textLabel {
        label.text = items[row]
      }
      return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let identifier = segue.identifier
    if (identifier == "showDetail") {
      // get the index path for the selected cell, then pass the
      // selected item to the next view controller
      if let indexPath = tableView.indexPathForSelectedRow {
        let row = indexPath.row
        let vc = segue.destination as! DetailViewController
        vc.text = items[row]
      }
    }
  }
}
