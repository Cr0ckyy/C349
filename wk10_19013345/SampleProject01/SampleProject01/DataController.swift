//
//  DataController.swift
//  SampleProject01
//
//  Created by day4 on 21/1/21.
//

import Foundation
class DataController {
    static var sharedInstance = DataController()
      
      // Make the initializer private (this prevents creation of other
      // instances of that class)
      private init() {
      }

      private var items : [String] = []
      
      var count : Int {
        return items.count
      }

      func add(item:String) {
        items.append(item)
      }
      
      func retrieve(index:Int) -> String {
        if (index < count) {
          return items[index]
        }
        return ""
      }
}
