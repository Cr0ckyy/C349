//
//  ViewControllerA.swift
//  Exercise 2
//
//  Created by day4 on 14/1/21.
//

import UIKit

class ViewControllerA: UIViewController {
    
    @IBOutlet weak var outSegment: UISegmentedControl!
    var word = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the destination view controller and cast it to the actual class
        let vc = segue.destination as! ViewControllerB
        // update the data object
        if outSegment.selectedSegmentIndex == 0 {
            word = "First"
        } else {
            word = "Second"
        }
        // Set the property of the destination view controller
        vc.word = word
      }
}
