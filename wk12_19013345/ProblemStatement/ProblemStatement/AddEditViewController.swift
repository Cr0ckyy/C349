import UIKit

class AddEditViewController: UITableViewController {
    
    @IBOutlet weak var outContact: UITextField!
    @IBOutlet weak var outAddress: UITextField!
    @IBOutlet weak var outPostalCode: UITextField!
    @IBOutlet weak var outName: UITextField!
    
    let dc = DataController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var index = dc.select
        
        if (dc.select != -1) {
            let data = DataController.sharedInstance.get(index: index)
            // set the text for the text fields
            outContact.text = data.contact
            outName.text = data.name
            outAddress.text = data.address
            outPostalCode.text = data.postal
        }
        
    }
    @IBAction func actSave(_ sender: Any) {
        var index = dc.select
        if (dc.select == -1) {
            dc.add(data: Contact(name: "\(outName.text!)", address: "\(outAddress.text!)", contact: "\(outContact.text!)", postal: "\(outPostalCode.text!)"))
        }
        else{
            let item = dc.get(index: index)
            item.name = outName.text!
            item.contact = outContact.text!
            item.address = outAddress.text!
            item.postal = outPostalCode.text!
        }
        if let vc = self.navigationController {
          vc.popViewController(animated: true)
        }
    }
}
