import UIKit

class NamedShape {
    var numberOfSides: Int
    var name: String
    init(name: String) {
        self.name = name
        self.numberOfSides = 0
    }
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides"
    }
}
class Square : NamedShape {
    var sideLength : Float
    
    init(sideLength : Float, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        super.numberOfSides = 4
    }
    
    func area() -> Float {
        return sideLength * sideLength
    }
    
    var perimeter : Float {
        return sideLength * 4
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

var square = Square(sideLength: 5.2, name: "my test square")
print(square.area())
print(square.perimeter)
print(square.numberOfSides)
