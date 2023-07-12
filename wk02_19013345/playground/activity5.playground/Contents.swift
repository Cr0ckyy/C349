import UIKit

class Shape {
  var name : String = ""
  
  func printName() {
    print("Shape name is \(name)")
  }
  
  init(name : String) {
    self.name = name
  }
}

class Circle : Shape {
  override func printName() {
    // replace behaviour
    print("Circle Shape")
  }
}

class Rectangle : Shape {
  override func printName() {
    // add on behaviour
    // call superclass method first
    super.printName()
    print("Rectangle Shape")
  }
}

var myCircle = Circle(name:"a circle")
myCircle.printName()

var myRectangle = Rectangle(name:"a rectangle")
myRectangle.printName()
