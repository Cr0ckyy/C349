import UIKit

enum CarBrand {
    case honda
    case nissan
    case toyota
}

class Car {
    var licensePlate:String
    var brand:CarBrand
    
    init(licensePlate:String, brand:CarBrand) {
        self.licensePlate = licensePlate
        self.brand = brand
    }
}

var myCar = Car(licensePlate: "SLJ125", brand: CarBrand.honda)
