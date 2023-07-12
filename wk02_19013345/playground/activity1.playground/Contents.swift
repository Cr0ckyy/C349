import UIKit

class Square {
  // class definition goes here

  // property
  var width = 0.0
  
  // method
  func area() -> Double {
    return width * width
  }
}

// create an instance
var mySquare = Square()
// set the property value
mySquare.width = 10
// read the property value
print(mySquare.width)
// call the method
print(mySquare.area())
