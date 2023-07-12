import UIKit

class NumberListViewController: UITableViewController {
    var number = [1,2,3,4,5,6,7,8,9,10]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath)
        
        let row = indexPath.row
        
        if let label = cell.textLabel {
            label.text = "\(number[row])"
        }
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)
      -> String? {
        return "Numbers"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let identifier = segue.identifier
       if (identifier == "toShow") {
         if let indexPath = tableView.indexPathForSelectedRow {
           let row = indexPath.row
           let vc = segue.destination as! MultiplicationListViewController
           vc.number = number[row]
            vc.rowNum = row
         }
       }
     }
}
