//
//  tax.swift
//  exercise4
//
//  Created by day4 on 12/11/20.
//

import Foundation
class Tax {
    
    var income : Double
    var totalpayable : Double
    var incomeTaxRate : Double
    
    init(income:Double) {
        self.income = income
        self.totalpayable = 0
        self.incomeTaxRate = 0
    }
    
    func round2dp(n : Double) -> Double {
        let y = round(n * 100) / 100
        return y;
    }

    func calc() -> String {
        if income > 20000 && income < 30000 {
            incomeTaxRate = 0.02
            totalpayable += ((income - 20000) * incomeTaxRate)
        } else if income > 30000 && income < 40000 {
            incomeTaxRate = 0.035
            totalpayable += 200
            totalpayable += ((income - 30000) * incomeTaxRate)
        } else if income > 40000 && income < 80000 {
            incomeTaxRate = 0.07
            totalpayable += 550
            totalpayable += ((income - 40000) * incomeTaxRate)
        } else if income > 80000 && income < 120000 {
            incomeTaxRate = 0.115
            totalpayable += 3350
            totalpayable += ((income - 80000) * incomeTaxRate)
        } else if income > 120000 && income < 160000 {
            incomeTaxRate = 0.15
            totalpayable += 7950
            totalpayable += ((income - 120000) * incomeTaxRate)
        } else if income > 160000 && income < 200000 {
            incomeTaxRate = 0.18
            totalpayable += 13950
            totalpayable += ((income - 160000) * incomeTaxRate)
        } else if income > 200000 && income < 240000 {
            incomeTaxRate = 0.19
            totalpayable += 21150
            totalpayable += ((income - 200000) * incomeTaxRate)
        } else if income > 240000 && income < 280000 {
            incomeTaxRate = 0.195
            totalpayable += 28750
            totalpayable += ((income - 240000) * incomeTaxRate)
        } else if income > 280000 && income < 320000 {
            incomeTaxRate = 0.20
            totalpayable += 36550
            totalpayable += ((income - 280000) * incomeTaxRate)
        } else if income > 320000 {
            incomeTaxRate = 0.22
            totalpayable += 44550
            totalpayable += ((income - 320000) * incomeTaxRate)
        }

        incomeTaxRate = round2dp(n: incomeTaxRate * 100)
        totalpayable = round2dp(n: totalpayable)

        return("For a salary of $\(income), the income tax is $\(totalpayable) the effective income tax rate is \(incomeTaxRate)%")
    }
}
