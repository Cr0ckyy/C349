//
//  Reminder.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 11/8/21.
//

import Foundation

class Reminder: Codable {
    var uuid: String = ""
    var title: String = ""
    var date_due: Date = Date()
    
    init(_ uuid: String, _ title: String, _ date_due: Date) {
        self.uuid = uuid
        self.title = title
        self.date_due = date_due
    }
    
    func get_date() -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "'Due' MMM dd 'at' hh:mm a"
        
        return "\(formatter.string(from: date_due))"
    }
}
