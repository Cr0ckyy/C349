import Foundation
class DataController {
  // the singleton object
  static let sharedInstance = DataController()
    var select = -1
  // private init prevents external creation
  private init() {
    let data1 = Contact(name: "John Tan", address: "1 Ang Mo Kio Avenue 1 #01-1234", contact: "98765432", postal: "560001")
    let data2 = Contact(name: "Diana Wee", address: "1 Toa Payoh Loron 1 #02-2345", contact: "92345678", postal: "310001")
    add(data: data1)
    add(data: data2)
  }
  
  // data structure to store data for the DataController
  private var contacts : [Contact] = []
  
  // calculated property to get the number of items in the DataController
  var count : Int {
    return contacts.count
  }
  
  // add an item to the DataController
  func add(data:Contact) {
    contacts.append(data)
  }
  
  // get an item from the DataController corresponding to the index
  func get(index:Int) -> Contact {
    return contacts[index]
  }
}
