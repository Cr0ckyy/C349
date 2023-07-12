//
//  ViewController.swift
//  SampleProject05
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // generates a random number between 0 (inclusive) and 10 (inclusive)
        var random1 = Int.random(in: 0...10)
        print(random1)

        // generates a random number between 10 (inclusive) and 20 (inclusive)
        var random2 = Int.random(in: 10...20)
        print(random2)
      }

}

