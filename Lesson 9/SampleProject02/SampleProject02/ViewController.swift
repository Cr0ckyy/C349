//
//  ViewController.swift
//  SampleProject02
//
//  Created by 19013345 Ju Long on 19/7/21.
//

import UIKit

enum SomeError: Error {
    case x
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        demoDoCatch()
        demoTryQuestionMark()
        demoTryExclamationMark()
    }

    func someFunction(shouldThrowError: Bool) throws -> Int {
        if shouldThrowError {
            throw SomeError.x
        }
        return 1
    }
    
    func demoDoCatch() {
        do {
            let value = try someFunction(shouldThrowError: false)
            print("demoDoCatch (no error): value is \(value)")
        } catch {
            print(error)
        }
        
        do {
            let value = try someFunction(shouldThrowError: true)
            print("demoDoCatch (error): value is \(value)")
        } catch {
            print(error)
        }
    }
    
    func demoTryQuestionMark() {
        let value1 = try? someFunction(shouldThrowError: false)
        print("demoTryQuestionMark (no error): value1 is \(value1)")
        
        let value2 = try? someFunction(shouldThrowError: true)
        print("demoTryQuestionMark (error): value2 is \(value2)")
    }
    
    func demoTryExclamationMark() {
        let value1 = try! someFunction(shouldThrowError: false)
        print("demoTryExclamationMark (no error): value1 is \(value1)")
        
        let value2 = try! someFunction(shouldThrowError: true)
        print("demoTryExclamationMark (error): value2 is \(value2)")
    }
}

