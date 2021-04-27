import Foundation
class DataController {
  // the singleton object
  static let sharedInstance = DataController()
  // private init prevents external creation
  fileprivate init() {
    let data1 = ContactData(name: "John Tan", contact: "98765432", postalCode: "560001", address: "1 Ang Mo Kio Avenue 1 #01-1234")
    let data2 = ContactData(name: "Diana Wee", contact: "92345678", postalCode: "310001", address: "1 Toa Payoh Lorong 1 #02-2345")
    add(data1)
    add(data2)
  }
  
  // data structure to store data for the DataController
  fileprivate var contacts : [ContactData] = []
  
  // calculated property to get the number of items in the DataController
  var count : Int {
    return contacts.count
  }
  
  // add an item to the DataController
  func add(_ data:ContactData) {
    contacts.append(data)
  }
  
  // get an item from the DataController corresponding to the index
  func get(_ index:Int) -> ContactData {
    return contacts[index]
  }
}
