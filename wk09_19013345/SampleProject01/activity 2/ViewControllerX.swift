import UIKit
class ViewControllerX: UIViewController {
  @IBOutlet weak var outLabel: UILabel!
  
  var dataX : String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    outLabel.text = dataX
  }
  
    @IBAction func actDismiss(_ sender: UIButton) {
        // comment out the call to dismiss(animated:completion:)
        // dismiss(animated: true, completion: nil)
        
        // call performSegue(withIdentifier:sender:)
        performSegue(withIdentifier: "exit", sender: self)
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if (identifier == "exit") {
          print("about to perform exit segue")
        }
      }
}
