import UIKit
class ViewController: UIViewController {
  @IBOutlet weak var outLabel: UILabel!
  
  // Define and initalise a property for the data object in the source view controller
  var name = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func unwindMethod(_ segue: UIStoryboardSegue) {
    outLabel.text = name
  }
  
  // Implement the prepareForSegue:sender: method in the source view controller
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the destination view controller and cast it to the actual class
    let vc = segue.destination as! ViewControllerX
    // update the data object
    name = "Clark Kent"
    // Set the property of the destination view controller
    vc.name = name
  }
}
