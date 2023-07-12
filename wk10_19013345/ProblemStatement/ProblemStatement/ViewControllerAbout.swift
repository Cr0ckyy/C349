//
//  ViewControllerAbout.swift
//  ProblemStatement
//
//  Created by day4 on 21/1/21.
//

import UIKit
import WebKit
class ViewControllerAbout: UIViewController {
    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var outWebView: WKWebView!

      override func viewDidLoad() {
        super.viewDidLoad()
        header.font = UIFont.boldSystemFont(ofSize: 30)
        header.backgroundColor = UIColor.yellow
        if let filePath = Bundle.main.url(forResource: "about",
                                          withExtension: "html") {
          let myRequest = URLRequest(url: filePath)
          outWebView.load(myRequest)
        }
        self.view.backgroundColor = UIColor.systemPink
      }
    
}
