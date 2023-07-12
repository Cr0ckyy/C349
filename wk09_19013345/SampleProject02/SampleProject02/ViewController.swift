import UIKit
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  @IBOutlet weak var outPickerView: UIPickerView!

  let dc = DataController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    outPickerView.delegate = self
    outPickerView.dataSource = self
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return dc.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String? {
    let key = dc.key(row)
    let item = dc.value(key)
    return "\(key) \(item)"
  }
}
