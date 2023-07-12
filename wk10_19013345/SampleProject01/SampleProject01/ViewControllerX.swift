//
//  ViewControllerX.swift
//  SampleProject01
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewControllerX: UIViewController {
    
    @IBOutlet weak var outLabel: UILabel!
     
      let dc = DataController.sharedInstance
      
      override func viewDidLoad() {
        super.viewDidLoad()
        print(#file, #function)
      }

      override func viewWillAppear(_ animated: Bool) {
        print(#file, #function)
        let count = dc.count
        if (count > 0) {
          outLabel.text = dc.retrieve(index: count-1)
        }
      }
}
