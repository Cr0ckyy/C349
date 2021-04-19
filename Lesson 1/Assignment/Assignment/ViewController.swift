//
//  ViewController.swift
//  Assignment
//
//  Created by 19013345 Ju Long on 19/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    var character = ""
    var show = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outImage.image = UIImage(named: "something")
        outImage.isHidden = !show
        if (show) {
            button.setTitle("hide \(character)", for: .normal)
        } else {
            button.setTitle("show \(character)", for: .normal)
        }
    }
    
    @IBAction func changeShow(_ sender: UIButton) {
        show.toggle()
        outImage.isHidden = !show
        if (show) {
            button.setTitle("hide \(character)", for: .normal)
        } else {
            button.setTitle("show \(character)", for: .normal)
        }
    }
    
    @IBAction func setting(_ sender: UIBarButtonItem) {
        
    }
}

