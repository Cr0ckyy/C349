//
//  bmiCalc.swift
//  Weight Management
//
//  Created by day4 on 5/11/20.
//

import Foundation
class BMI {
    var weight:Double
    var height:Double
    
    init(weight:Double, height:Double, weightChoice:Int, heightChoice:Int) {
        if weightChoice == 0 {
            self.weight = weight
        } else {
            self.weight = weight * 0.453592
        }
        
        if heightChoice == 0 {
            self.height = height
        } else {
            self.height = height * 0.3048
        }
    }
    
    func bmi() -> Double {
        return (round(weight / (height * height) * 100) / 100)
    }
}
