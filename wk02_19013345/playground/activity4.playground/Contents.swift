import UIKit

class Square {
  // class definition goes here

  // property
  var width : Double
  
  // method
  func area() -> Double {
    return width * width
  }
  
  // initializer
  init(width: Double) {
    // self.width refers to the property,
    // whereas width refers to the parameter
    self.width = width
  }
}

// create an instance
var mySquare = Square(width: 10)
// read the property value
print(mySquare.width)
// call the method
print(mySquare.area())

