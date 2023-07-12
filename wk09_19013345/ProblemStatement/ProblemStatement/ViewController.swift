
import UIKit

class ViewController:  UIViewController, UIPickerViewDataSource,
                       UIPickerViewDelegate {

    @IBOutlet weak var postalCode: UILabel!
    @IBOutlet weak var postalCodeInput: UITextField!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var streetInput: UITextField!
    @IBOutlet weak var options: UISegmentedControl!
    let postal = UIPickerView()
    let data = DataController()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
      }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(data.key(row))"
      }

    func style() {
        options.removeAllSegments()
        options.insertSegment(withTitle: "Edit", at: 0, animated: true)
        options.insertSegment(withTitle: "Add", at: 1, animated: true)

        postalCode.font = UIFont.boldSystemFont(ofSize: 20)
        postalCode.backgroundColor = UIColor.darkGray
        postalCode.textColor = UIColor.white
        street.font = UIFont.boldSystemFont(ofSize: 20)
        street.backgroundColor = UIColor.darkGray
        street.textColor = UIColor.white

        postal.dataSource = self
        postal.delegate = self

        postalCodeInput.inputView = postal
        postalCodeInput.inputAccessoryView = createToolbar(action:#selector(pickerDone))
    }

    @objc func pickerDone() {
        postalCodeInput.resignFirstResponder()
        let item = data.key(postal.selectedRow(inComponent: 0))
        postalCodeInput.text = String(item)
        streetEntry()
    }

    func createToolbar(action:Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
        toolbar.setItems([spacer, button], animated: true)
        toolbar.sizeToFit()

        return toolbar
      }

    func streetEntry() {
        if let entry = postalCodeInput.text,
           let entryno = Int(entry) {
            streetInput.text =  data.value(entryno)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the destination view controller and cast it to the actual class
        let vc = segue.destination as! ViewControllerAction
        if options.selectedSegmentIndex == 0 {
            vc.postalData = postalCodeInput.text!
            vc.streetData = streetInput.text!
            vc.data = data
        } else{
            vc.postalData = ""
            vc.streetData = ""
            vc.data = data
        }
      }
    @IBAction func unwindMethod(_ segue: UIStoryboardSegue) {
        postal.reloadAllComponents()
      }
}
