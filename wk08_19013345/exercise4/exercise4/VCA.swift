import UIKit

class VCA: UIViewController {

    var data = Data()
    @IBOutlet weak var firstNo: UITextField!
    @IBOutlet weak var secondNo: UITextField!
    @IBOutlet weak var header: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    @IBAction func unwindMethod(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as! VCB
        if let first = firstNo.text,
           let second = secondNo.text,
           let firstNumber:Int = Int(first),
           let secondNumber:Int = Int(second) {
            vc.f = firstNumber
            vc.s = secondNumber
        }
     }
}
