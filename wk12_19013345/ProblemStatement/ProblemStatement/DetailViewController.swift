import UIKit

class DetailViewController: UITableViewController {
    
    @IBOutlet weak var outName: UILabel!
    @IBOutlet weak var outContact: UILabel!
    @IBOutlet weak var outAddress: UILabel!
    @IBOutlet weak var outPostalCode: UILabel!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
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
    
}
