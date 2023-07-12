import UIKit

var grades = ["DIST", "A", "B+", "B", "C+", "C", "D+", "D", "F"]

for grade in grades{
    var gradePoint = 0.0
    
    if grade == "DIST" {
        gradePoint = 4.0
    } else if grade == "A" {
        gradePoint = 4.0
    } else if grade == "B+" {
        gradePoint = 3.5
    } else if grade == "B" {
        gradePoint = 3
    } else if grade == "C+" {
        gradePoint = 2.5
    } else if grade == "C" {
        gradePoint = 2
    } else if grade == "D+" {
        gradePoint = 1.5
    } else if grade == "D" {
        gradePoint = 1
    } else if grade == "F" {
        gradePoint = 0
    }
    print("Grade \(grade) is equals to a grade point of \(gradePoint)")
}
