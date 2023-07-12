import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
UIPickerViewDelegate {
    @IBOutlet weak var outPickerView: UIPickerView!
    var car : [Car] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        outPickerView.dataSource = self
        outPickerView.delegate = self
      }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }
    
    func pickerView(_ pickerView: UIPickerView,
                      numberOfRowsInComponent component: Int) -> Int {
        return car.count
      }
      
      func pickerView(_ pickerView: UIPickerView,
                      titleForRow row: Int,
                      forComponent component: Int) -> String? {
        let carData = car[row]
        return "\(carData.manufacturer)\(carData.model)"
      }

}

