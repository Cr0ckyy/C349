//
//  ViewControllerB.swift
//  Activity 1
//
//  Created by 19013345 Ju Long on 19/4/21.
//

import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var outLabel: UILabel!
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outLabel.text = text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
