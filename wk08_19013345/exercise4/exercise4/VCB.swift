//
//  VCB.swift
//  exercise4
//
//  Created by day4 on 7/1/21.
//

import UIKit

class VCB: UIViewController {
    
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var choice: UISegmentedControl!
    var f:Int!
    var s:Int!
    var data = Data()
    
    var choices = ["Add", "Subtract", "Multiply"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        first.text = "\(f!)"
        second.text = "\(s!)"
        choice.removeAllSegments()
        for index in 0..<choices.count {
            choice.insertSegment(withTitle: choices[index], at: index, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the destination view controller and cast it to the actual class
        let vc = segue.destination as! VCC
        data.firstNo = f
        data.secondNo = s
        data.choice = choices[choice.selectedSegmentIndex]
        vc.data = data
      }

}
