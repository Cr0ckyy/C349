import Foundation
class DataController {
  private var postalStreetList : [Int : String] = [530203: "203 Hougang Street 21", 540901: "901 Jurong West Street 91"]
  
  // Retrieve count
  var count : Int {
    return postalStreetList.count
  }
  
  // Search / retrieve key index from key
  func index(_ key : Int) -> Int? {
    let keys = postalStreetList.keys.sorted()
    return keys.firstIndex(of: key)
  }
  
  // Retrieve key from key index
  func key(_ index : Int) -> Int {
    let keys = postalStreetList.keys.sorted()
    return (keys[index])
  }
  
  // Retrieve value from key
  func value(_ key : Int) -> String {
    let value = "\(postalStreetList[key] ?? "")"
    return value
  }
  
  // Create
  // Update
  func add(_ key:Int, value:String) {
    postalStreetList[key] = value
  }
  
  // Delete
  func remove(_ key : Int) {
    postalStreetList[key] = nil
  }
}
