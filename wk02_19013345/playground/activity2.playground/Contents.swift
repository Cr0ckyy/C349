import UIKit

class Square {
  // class definition goes here

  // stored properties
  var width = 0.0      // variable
  let color = "white"  // constant

  // computed property
  var area: Double {
    return width * width
  }
}

// create an instance
var mySquare = Square()
// set the stored property value
mySquare.width = 10
// read the stored property values
print(mySquare.color)
print(mySquare.width)
// read the computed property
print(mySquare.area)

mySquare.color="red"
