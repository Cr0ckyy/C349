//
//  ViewController.swift
//  SampleProject03
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let resultX = (4.0, "A")
        print("resultX The gpa is \(resultX.0)")    // prints "The gpa is 4.0"
        print("resultX The grade is \(resultX.1)")  // prints "The grade is A"
        
        let resultY = (gpa: 4.0, grade: "A")
        print("resultY The gpa is \(resultY.0)")        // prints "The gpa is 4.0"
        print("resultY The gpa is \(resultY.gpa)")      // prints "The gpa is 4.0"
        print("resultY The grade is \(resultY.1)")      // prints "The grade is A"
        print("resultY The grade is \(resultY.grade)")  // prints "The grade is A"
        
        let resultZ = (gpa: 4.0, grade: "A")
        
        let (gpa, grade) = resultZ
        print("resultZ The gpa is \(gpa)")         // prints "The gpa is 4.0"
        print("resultZ The grade is \(grade)")     // prints "The grade is A"
        
        let (gpaOnly, _) = resultZ
        print("resultZ The gpa is \(gpaOnly)")     // prints "The gpa is 4.0"
      }
}

