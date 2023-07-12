import UIKit

class VCA: UIViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var outLabel: UILabel!
    var name = data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    @IBAction func unwindMethod(_ segue: UIStoryboardSegue) {
        outLabel.text = name.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the destination view controller and cast it to the actual class
       let vc = segue.destination as! VCB
       // update the data object
        name.name = ""
       // Set the property of the destination view controller
       vc.data = name
     }
}
