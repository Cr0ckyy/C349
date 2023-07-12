import Foundation
class DataController{
    
    static var sharedInstance = DataController()
    var personArray = [Person(firstName: "John", lastName: "Tan"),
                       Person(firstName: "Jenny", lastName: "Lee")]
}
