//
//  ViewController.swift
//  SampleProject02
//
//  Created by day4 on 21/1/21.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    @IBOutlet weak var outWebView: WKWebView!

      override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = Bundle.main.url(forResource: "www.google", withExtension: "com") {
          let myRequest = URLRequest(url: filePath)
          outWebView.load(myRequest)
        }
      }
}

