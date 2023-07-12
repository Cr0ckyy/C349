//
//  ViewController.swift
//  SampleProject04
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ===============================================================
        // classes are reference types
        var classExample1 = ClassExample(value: 1.0)

        // classExample1 and classExample2 reference the same instance
        var classExample2 = classExample1

        print("classExample1.value is \(classExample1.value)")
        print("classExample2.value is \(classExample2.value)")
        // classExample1.value is 1.0
        // classExample2.value is 1.0

        classExample2.value = 2.0
        print("classExample1.value is \(classExample1.value)")
        print("classExample2.value is \(classExample2.value)")
        // classExample1.value is 2.0
        // classExample2.value is 2.0

        // classExample2.value = 2.0 sets the value of the instance to 2.0
        // reading the value via classExample1 is the same as
        // reading the value via classExample2

        // ===============================================================
        // structs are value types
        var structExample1 = StructExample(value: 1.0)

        // the values from the instance in structExample1 are copied
        // to a new instance in structExample2
        var structExample2 = structExample1

        print("structExample1.value is \(structExample1.value)")
        print("structExample2.value is \(structExample2.value)")
        // structExample1.value is 1.0
        // structExample2.value is 1.0

        structExample2.value = 2.0
        print("structExample1.value is \(structExample1.value)")
        print("structExample2.value is \(structExample2.value)")
        // structExample1.value is 1.0
        // structExample2.value is 2.0

        // structExample2.value = 2.0 sets the value of the instance to 2.0
        // structExample1 has no relationship to structExample2
        // they are two different instances
      }
}

