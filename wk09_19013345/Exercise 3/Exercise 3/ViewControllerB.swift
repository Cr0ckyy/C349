//
//  ViewControllerB.swift
//  Exercise 3
//
//  Created by day4 on 14/1/21.
//

import UIKit

class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Dismiss or Unwind.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: "Cancel action"), style: .cancel, handler: { _ in
        NSLog("Dismiss")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Unwind", comment: "Default action"), style: .default, handler: actDismiss))
        self.present(alert, animated: true, completion: nil)
    }
    
    func actDismiss(alert: UIAlertAction!) {
        NSLog("Unwind")
        dismiss(animated: true, completion: nil)
    }
}
