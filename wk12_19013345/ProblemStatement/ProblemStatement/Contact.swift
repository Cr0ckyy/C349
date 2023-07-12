import Foundation

class Contact
{
    var name: String
    var address: String
    var contact: String
    var postal: String
    
    init(name: String, address: String, contact: String, postal: String)
    {
        self.name = name
        self.address = address
        self.contact = contact
        self.postal = postal
    }
}
