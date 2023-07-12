import UIKit

class Person {
    var firstName : String
    var lastName : String
    var age : Int
    var gender : String
    
    var male : Bool {
        if gender == "male" {
            return true
        } else {
            return false
        }
    }
    
    var age_classification : String {
        if age < 20 {
            return "junior"
        } else if age > 59 {
            return "senior"
        } else {
            return "adult"
        }
    }
    
    var fullname : String {
        return "\(lastName), \(firstName)"
    }
    
    init (firstName: String, lastName: String, age: Int, gender: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    func years_to_retirement(retirement_age: Int) -> Int {
        let years_remain = retirement_age - self.age
        if (years_remain <= 0) {
            return 0
        }
        return years_remain
    }
}

var person1 = Person(firstName: "Tom", lastName: "Hanks", age: 50, gender: "male")
print("Full Name: \(person1.fullname)")
print("Description: \(person1.age_classification)")
print("\(person1.years_to_retirement(retirement_age: 67)) years to retirement")
