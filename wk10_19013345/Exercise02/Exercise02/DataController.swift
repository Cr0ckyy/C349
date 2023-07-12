//
//  DataController.swift
//  Exercise02
//
//  Created by day4 on 21/1/21.
//

import Foundation
class DataController {
    static var sharedInstance = DataController()
    private init() {
    }
    
    private var selected = -1
    
    private var names = ["Alan", "Daniel", "Jessica"]
    
    var count : Int {
        return names.count
    }
    
    func add(_ item:String){
        names.append(item)
    }
    
    func edit(_ oldInt:Int,_ newName:String){
        if (names.count > oldInt) {
            names[oldInt] = newName
        }
    }
    
    func retrieve(_ index:Int) -> String {
        if (index < count && index > -1) {
            return names[index]
        }
        return ""
    }
    
    func select(_ number:Int){
        selected = number
    }
    
    func getSelect() -> Int{
        return selected
    }
}
