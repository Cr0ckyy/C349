//
//  DataController.swift
//  Assignment_19013345
//
//  Created by day4 on 28/1/21.
//

import Foundation
class DataController {
    var name: String = ""
    var color: String = ""
    var address: String = ""
    var date:Date = Date()
    var colors = ["Black", "White", "Red"]
    
    func getDays() -> String {
        let curr = Date()
        if (curr == date) {
            return "Today"
        }
        print(date.compare(curr))
        return ""
    }
}
