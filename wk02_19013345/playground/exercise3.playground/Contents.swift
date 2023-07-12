import UIKit

class Student {
    var studentID : String
    var firstName : String
    var lastName : String

    var fullname : String {
        return "\(firstName) \(lastName)"
    }

    var matriculation_year : String {
        let year = studentID.prefix(2)
        return "20\(year)"
    }
    
    init(studentID: String, firstName: String, lastName: String) {
        self.studentID = studentID
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func intro(diploma d: String, job j: String){
        print("I am \(fullname) from \(d), an aspiring \(j)")
    }
}
var student1 = Student(studentID: "17123456", firstName: "John", lastName: "Tan")
print(student1.studentID)
print(student1.fullname)
print(student1.matriculation_year)
student1.intro(diploma: "DMSD", job: "Mobile Software Developer")
