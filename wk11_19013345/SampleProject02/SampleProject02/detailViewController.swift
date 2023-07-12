import UIKit
class DetailViewController: UIViewController {
    @IBOutlet weak var outLabel: UILabel!
    
  var text : String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    outLabel.text = text
  }
}
