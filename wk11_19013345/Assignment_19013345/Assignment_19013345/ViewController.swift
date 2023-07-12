//
//  ViewController.swift
//  Assignment_19013345
//
//  Created by day4 on 28/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outName: UILabel!
    @IBOutlet weak var outColor: UILabel!
    @IBOutlet weak var outDays: UILabel!
    @IBOutlet weak var outAddress: UILabel!
    var data = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outName.font = UIFont.boldSystemFont(ofSize: 32)
    }

    @IBAction func unwindSegueMethod(_ sender: UIStoryboardSegue) {
        print("unwind")
        outName.text = data.name
        outColor.text = data.color
        outDays.text = data.getDays()
        outAddress.text = data.address
        print(data.name)
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as! EditViewController
       vc.data = data
     }
}

