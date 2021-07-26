//
//  ViewController.swift
//  SampleProject03
//
//  Created by Ju Long on 26/7/21.
//

import UIKit

class MyData : Codable  {
  var name : String = ""
  var friends : [String] = []
}

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // create a MyData object with some values
    var myData1 = MyData()
    myData1.name = "John"
    myData1.friends = ["Lucy", "Ben"]
    var myData2 = MyData()
    myData2.name = "Lucy"
    myData2.friends = ["John"]

    var myDataArray : [MyData] = [myData1, myData2]
    
    // create a variable to hold the JSON data for later use
    var jsonData : Data! = nil
    
    // JSON encoding which converts a Swift object to a JSON object
    // Step 1 - create the JSONEncoder object
    let encoder = JSONEncoder()
    // Step 2 - encode the Swift object into a JSON object
    if let encodedJSON = try? encoder.encode(myDataArray) {
      // encodedJSON now contains the JSON object
      // save a copy to jsonData so we can use it later
      jsonData = encodedJSON
      // this part is just for debugging, we want to see the
      // jsonData as a String and print it to the debug area
      if let stringData = String(data: encodedJSON, encoding: .utf8) {
        print("=============================")
        print("Debugging to view JSON string")
        print("=============================")
        print(stringData)
      }
    }
    
    // JSON decoding which converts a JSON object to a Swift object
    // Step 1 - create the JSONDecoder object
    let decoder = JSONDecoder()
    // Step 2 - decode the JSON object into a Swift object
    if let myDecodedData = try? decoder.decode([MyData].self, from: jsonData) {
      // this part is just for debugging, we want to print the
      // data from the Swift object to the debug area
      print("==============================")
      print("Debugging to view Swift object")
      print("==============================")
      print(myDecodedData[0].name)
      print(myDecodedData[0].friends)
      print(myDecodedData[1].name)
      print(myDecodedData[1].friends)
    }
  }
}
