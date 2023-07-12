import Foundation
class DataController {
  private var items : [String : String] = ["17123456": "John Lee", "17987654": "David Tan"]
  
  // Retrieve count
  var count : Int {
    return items.count
  }
  
  // Search / retrieve key index from key
  func index(_ key : String) -> Int? {
    let keys = items.keys.sorted()
    return keys.firstIndex(of: key)
  }
  
  // Retrieve key from key index
  func key(_ index : Int) -> String {
    let keys = items.keys.sorted()
    return keys[index]
  }
  
  // Retrieve value from key
  func value(_ key : String) -> String {
    let value = items[key] ?? ""
    return value
  }
  
  // Create
  // Update
  func add(_ key:String, value:String) {
    items[key] = value
  }
  
  // Delete
  func remove(_ key : String) {
    items[key] = nil
  }
}
