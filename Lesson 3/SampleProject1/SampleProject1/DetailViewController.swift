//
//  DetailViewController.swift
//  SampleProject1
//
//  Created by 19013345 Ju Long on 3/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var outTextView: UITextView!
    var stringData: String!
    var delegate: MyProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#file) \(#function) \(#line)")
        
        if let text = stringData {
            outTextView.text = text
        }
    }
    
    @IBAction func actShuffle(_ sender: Any) {
        if let delegate = delegate {
            delegate.shuffle()
        }
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
