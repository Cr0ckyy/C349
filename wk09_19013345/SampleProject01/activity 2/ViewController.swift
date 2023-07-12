import UIKit
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let identifier = segue.identifier
    if (identifier == "segueToY") {
      let vc = segue.destination as! ViewControllerY
      vc.dataY = "segue to Y"
    } else {
      let vc = segue.destination as! ViewControllerX
      if (identifier == "segue1ToX") {
        vc.dataX = "segue1 to X"
      } else if (identifier == "segue2ToX") {
        vc.dataX = "segue2 to X"
      }
    }
  }
    @IBAction func actSegue3(_ sender: UIButton) {
        performSegue(withIdentifier: "segue3ToX", sender: self)
    }
    
    @IBAction func unwindSegueMethod(_ sender: UIStoryboardSegue) {
       print("unwind")
     }
}
