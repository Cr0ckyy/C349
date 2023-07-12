//
//  bank.swift
//  exercise3
//
//  Created by day4 on 12/11/20.
//

import Foundation
class Bank {
    var amount:Double
    
    init(amount:Double) {
        self.amount = amount
    }
    
    func deposit(amountInput:Double) -> String {
        self.amount += amountInput
        return "\(self.amount)"
    }
    
    func withdraw(amountOutput:Double) -> Double {
        if self.amount - amountOutput >= 0 {
            self.amount -= amountOutput
            return self.amount
        }
        return -1;
    }
}
