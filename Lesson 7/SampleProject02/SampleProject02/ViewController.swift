//
//  ViewController.swift
//  SampleProject02
//
//  Created by 19013345 Ju Long on 7/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(add(x: nil, y: 3))
        print(add(x: 1, y: nil))
        print(add(x: 1, y: 3))
        print(add(x: 1, y: 2))
    }

    func add(x: Int?, y: Int?) -> Int? {
        guard let x = x, let y = y, y % 2 == 0 else {
            return nil
        }
        return x + y
    }
}

