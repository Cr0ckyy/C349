//
//  ViewControllerAction.swift
//  ProblemStatement
//
//  Created by day4 on 14/1/21.
//

import UIKit

class ViewControllerAction: UIViewController {
    
    @IBOutlet weak var postalCode: UILabel!
    @IBOutlet weak var postalCodeInput: UITextField!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var streetInput: UITextField!
    @IBOutlet weak var options: UISegmentedControl!
    var postalData:String?
    var streetData:String?
    var data = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        
        postalCodeInput.text = postalData
        streetInput.text = streetData
    }
    
    func style() {
        options.removeAllSegments()
        options.insertSegment(withTitle: "Delete", at: 0, animated: true)
        options.insertSegment(withTitle: "Save", at: 1, animated: true)
        
        postalCode.font = UIFont.boldSystemFont(ofSize: 20)
        postalCode.backgroundColor = UIColor.darkGray
        postalCode.textColor = UIColor.white
        street.font = UIFont.boldSystemFont(ofSize: 20)
        street.backgroundColor = UIColor.darkGray
        street.textColor = UIColor.white
    }
    
    func end(alert: UIAlertAction!) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    
    @IBAction func action(_ sender: UISegmentedControl) {
        if options.selectedSegmentIndex == 0 {
            if let entry = postalCodeInput.text,
               entry.count == 6,
               let entryno = Int(entry) {
                if data.index(entryno) != nil {
                    data.remove(entryno)
                    
                    let alert = UIAlertController(title: "Deleted", message: "\(entryno) has been deleted", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "default action"), style: .default, handler: end))
                    self.present(alert, animated: true, completion: nil)
                    print(data.count)
                } else {
                    let alert = UIAlertController(title: "Data entry did not match data", message: "\(entryno) is not available", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "cancel action"), style: .cancel, handler: { _ in
                    NSLog("no data")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Error data entry", message: "Fail to perform delete due to entry failure", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "cancel action"), style: .cancel, handler: { _ in
                NSLog("fail to delete")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            if let entry = postalCodeInput.text,
               entry.count == 6,
               let entryno = Int(entry),
               let street = streetInput.text{
                if data.index(entryno) == nil {
                    data.add(entryno, value: street)
                    
                    let alert = UIAlertController(title: "Data added", message: "Postal \(entryno) with value \(street) has successfully added", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "default action"), style: .default, handler: end))
                    self.present(alert, animated: true, completion: nil)
                    print(data.count)
                } else {
                    data.add(entryno, value: street)
                    
                    let alert = UIAlertController(title: "Data edited", message: "Postal code \(entryno) with value \(street) has successfully edited", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "default action"), style: .default, handler: end))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Error data entry", message: "Fail to perform add/edit due to entry failure", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "cancel action"), style: .cancel, handler: { _ in
                NSLog("fail to add/edit")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
