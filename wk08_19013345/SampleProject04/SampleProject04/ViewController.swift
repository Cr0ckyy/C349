import UIKit
class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func actShowAlert(_ sender: UIButton) {
    // create the UIAlertController object
    let alert = UIAlertController(title: "Title goes here",
                                  message: "Message goes here",
                                  preferredStyle: .alert)
    
    // create the UIAlertAction objects
    let cancelAction = UIAlertAction(title: "Cancel",
                                     style: .default) { (action:UIAlertAction) in
                                      // code to be executed when button is pressed
                                      print("cancel button pressed")
    }
    let doneAction = UIAlertAction(title: "Done",
                                   style: .default) { (action:UIAlertAction) in
                                    // code to be executed when button is pressed
                                    print("done button pressed")
    }
    
    // add the UIAlertAction objects to the UIAlertController
    alert.addAction(cancelAction)
    alert.addAction(doneAction)
    
    // show the alert
    present(alert, animated: true, completion: nil)
  }
}
