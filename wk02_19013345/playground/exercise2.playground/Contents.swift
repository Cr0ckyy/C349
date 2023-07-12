import UIKit

class Circle {
    var radius : Double
    
    func calculate_area() -> Double {
        var area = radius * radius * 3.142
        area = round(area * 100) / 100
        return area
    }
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func size() -> String {
        if calculate_area() <= 1 {
            return "small"
        } else if calculate_area() >= 100 {
            return "large"
        } else {
            return "medium"
        }
    }
    
    func sectorArea(angle : Double) -> Double {
        var area = 3.142 * radius * radius * (angle / 360)
        area = round(area * 100) / 100
        return area
    }
}

var cirle1 = Circle(radius : 5)
print(cirle1.calculate_area())
print(cirle1.size())
cirle1.radius = 15
print(cirle1.sectorArea(angle: 60))
