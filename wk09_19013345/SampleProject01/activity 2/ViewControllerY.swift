import UIKit
class ViewControllerY: UIViewController {
  @IBOutlet weak var outLabel: UILabel!
  
  var dataY : String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    outLabel.text = dataY
  }
  
  @IBAction func actDismiss(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}
