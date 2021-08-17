//
//  ViewController.swift
//  Question03_19013345
//
//  Created by Ju Long on 16/8/21.
//

import UIKit

class Durian: Codable {
    var rarity: String = ""
    var source: String = ""
    var type: String = ""
}

class ViewController: UIViewController {
    
    @IBOutlet weak var typeInput: UITextField!
    @IBOutlet weak var sourceOutput: UILabel!
    @IBOutlet weak var rarityOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        guard let url = URL(string: "https://343de32b11a9.ngrok.io/search") else {
            return
        }
        
        // Step 2 - Create a URLRequest object
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let durian = Durian()
        durian.type = "\(typeInput.text!)"
        
        let encoder = JSONEncoder()
        if let encodedJSON = try? encoder.encode(durian) {
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
                    let decoder = JSONDecoder()
                    if let data = data,  let myDecodedData = try? decoder.decode(Durian.self, from: data) {
                        print("<<DEBUG>> Debugging to view returned data")
                        print("data is \(data)")
                        DispatchQueue.main.async {
                            self.sourceOutput.text = myDecodedData.source
                            self.rarityOutput.text = myDecodedData.rarity
                        }
                    }
                }
            }
        }
        
        // Step 5 - Start / resume the task
        task.resume()
    }
    
}

