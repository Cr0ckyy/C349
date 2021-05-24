import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    // property to track the last edited text field
    var activeTextField : UITextField? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var outTextField1: UITextField!
    @IBOutlet weak var outTextField2: UITextField!
    @IBOutlet weak var outTextField3: UITextField!
    @IBOutlet weak var outTextField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outTextField1.delegate = self
        outTextField2.delegate = self
        outTextField3.delegate = self
        outTextField4.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // called when the text field identified by textField starts being edited
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // track the currently edited text field
        self.activeTextField = textField
    }
    
    // called when the text field identified by textField stops being edited
    func textFieldDidEndEditing(_ textField: UITextField) {
        // reset the property
        self.activeTextField = nil
    }
    
    @IBAction func actDone(_ sender: UIBarButtonItem) {
        if let activeTextField = activeTextField {
            activeTextField.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}
