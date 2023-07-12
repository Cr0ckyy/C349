//
//  DataController.swift
//  ProblemStatement
//
//  Created by day4 on 21/1/21.
//

import Foundation
class DataController {
    static var sharedInstance = DataController()
    private init() {
    }
    
    private var choices = ["Rock", "Paper", "Scissors"]
    private var win = 0
    private var lose = 0
    private var draw = 0
    private var log : [String] = []
    
    func generator() -> String {
        let number = Int.random(in: 0..<choices.count)
        return choices[number]
    }
    
    func result(_ myInput:String,_ opponentInput:String) -> String{
        if myInput == opponentInput {
            log.append("\(myInput) vs \(opponentInput), Its a Draw!")
            draw += 1
            return "Its a Draw!"
        } else if ((myInput == "Rock" && opponentInput == "Paper") || (myInput == "Scissors" && opponentInput == "Paper") || (myInput == "Rock" && opponentInput == "Scissors")) {
            log.append("\(myInput) vs \(opponentInput), You Win!")
            win += 1
            return "You Win!"
        }  else {
            log.append("\(myInput) vs \(opponentInput), You Lose!")
            lose += 1
            return "You Lose!"
        }
    }
    
    func getWin() -> String{
        return "\(win)"
    }
    
    func getLose() -> String{
        return "\(lose)"
    }
    
    func getDraw() -> String{
        return "\(draw)"
    }
    
    func getLog() -> String {
        var output = ""
        for i in log {
            output += i + "\n"
        }
        return output
    }
}
