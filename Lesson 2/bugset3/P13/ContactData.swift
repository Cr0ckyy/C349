import Foundation
class ContactData {
  // MARK: - properties
  var name : String
  var contact : String
  var postalCode : String
  var address : String
  
  
  // MARK: - initializers
  init() {
    self.name = ""
    self.contact = ""
    self.postalCode = ""
    self.address = ""
  }
  
  init(name:String, contact:String, postalCode:String, address:String) {
    self.name = name
    self.contact = contact
    self.postalCode = postalCode
    self.address = address
  }
}
