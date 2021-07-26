//
//  ViewController.swift
//  SampleProject05
//
//  Created by Ju Long on 26/7/21.
//

import UIKit

class MyJob : Codable {
  var company : String = ""
  var title : String = ""
}

class MyData : Codable  {
  var name : String = ""
  var friends : [String] = []
  var job : MyJob!
}

class ViewController: UIViewController {
  @IBOutlet weak var outTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Step 1 - Create a URL object
    guard let url = URL(string: "https://981e7a1f2d3f.ngrok.io/activity09") else {
      return
    }
    
    // Step 2 - Create a URLRequest object
    var request = URLRequest(url:url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // create a MyData object with some values
    var myData = MyData()
    myData.name = "John"
    myData.friends = ["Lucy", "Ben"]
    myData.job = MyJob()
    myData.job.company = "Google"
    myData.job.title = "UX Engineer"
 
    // JSON encoding which converts a Swift object to a JSON object
    let encoder = JSONEncoder()
    if let encodedJSON = try? encoder.encode(myData) {
      request.httpBody = encodedJSON
    }
    
    // Step 3 - Create a URLSession object
    let session = URLSession.shared
    
    // Step 4 - Create a URLSessionDataTask object
    let task = session.dataTask(with: request) { (data, response, error) in
      // Step 6 - Process the response
      // check that the response status code is 200
      if let httpResponse = response as? HTTPURLResponse {
        // For debugging purposes, we convert the optional Data to a String
        print("<<DEBUG>> Debugging to view status code")
        print("httpResponse.statusCode is \(httpResponse.statusCode)")
        if (httpResponse.statusCode == 200) {
          // For debugging purposes, we convert the optional Data to a String
          // so that it can be printed out in the debug area
          if let data = data, let stringData = String(data: data, encoding: .utf8) {
            print("<<DEBUG>> Debugging to view returned data")
            print("data is \(stringData)")
            DispatchQueue.main.async {
              self.outTextView.text = stringData
            }
          }
        }
      }
    }
    
    // Step 5 - Start / resume the task
    task.resume()
  }
}
