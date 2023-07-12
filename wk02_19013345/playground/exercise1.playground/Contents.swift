import UIKit

class Rectangle {
    var height : Double
    var width : Double
    
    var calculate_area : Double {
        return width * height
    }
    
    init(height : Double, width : Double) {
        self.height = height
        self.width = width
    }
    
    func compareArea(_ anotherRectangle : Rectangle) -> Int {
        let area1 = self.calculate_area
        let area2 = anotherRectangle.calculate_area
        
        if (area1 > area2) {
            return 1
        } else if (area1 < area2) {
            return -1
        } else {
            return 0
        }
    }
}

var rectangle1 = Rectangle(height: 6, width: 10)
print(rectangle1.calculate_area)
var rectangle2 = Rectangle(height: 8, width: 8)
print(rectangle2.calculate_area)
print(rectangle1.compareArea(rectangle2))
