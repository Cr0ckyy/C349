import UIKit
class TableViewController: UITableViewController {
    
    var car = [
        Car(model:"Vezel",manufacturer: "Honda"),
        Car(model:"CX-30",manufacturer: "Mazda"),
        Car(model: "X3", manufacturer: "BMW"),
        Car(model:"Yaris Cross",manufacturer: "Toyota"),
        Car(model: "X-Trail", manufacturer: "Nissan"),
    ]
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return car.count
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
      if let cell = tableView.cellForRow(at: indexPath) {
        cell.accessoryType = .checkmark
      }
    }
    
    override func tableView(_ tableView: UITableView,
                            didDeselectRowAt indexPath: IndexPath) {
      if let cell = tableView.cellForRow(at: indexPath) {
        cell.accessoryType = .none
      }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row = indexPath.row
        
      if let label = cell.textLabel {
          label.text = car[row].model
            }
            if let label = cell.detailTextLabel {
              label.text = car[row].manufacturer
            }
        cell.accessoryType = .none
        if let indexPaths = tableView.indexPathsForSelectedRows {
          if (indexPaths.contains(indexPath)) {
            cell.accessoryType = .checkmark
          }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
        var carData : [Car] = []
        for i in 0 ..< selectedIndexPaths.count {
          let indexPath = selectedIndexPaths[i]
          let row = indexPath.row
          let data = car[row]
          carData.append(data)
        }
        let vc = segue.destination as! ViewController
        vc.car = carData
      }
    }
  }
