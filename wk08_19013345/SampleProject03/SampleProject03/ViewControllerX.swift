import UIKit
class ViewControllerX: UIViewController {
  @IBOutlet weak var outLabel: UILabel!
  
  // Define an implicitly unwrapped optional property for
  // the data object in the destination view controller
  var name : String!

  override func viewDidLoad() {
    super.viewDidLoad()
    // do something with the received data
    outLabel.text = name
    // modify the value of name
    name = "Bruce Wayne"
  }
}
