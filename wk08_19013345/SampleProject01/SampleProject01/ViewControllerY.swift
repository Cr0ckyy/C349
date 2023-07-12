import UIKit
class ViewControllerY: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.systemRed
  }
  
  @IBAction func actDismiss(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}
