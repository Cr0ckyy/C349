//
//  DataController.swift
//  SampleProject2
//
//  Created by 19013345 Ju Long on 19/4/21.
//

import Foundation
class DataController {
    static let sharedInstance = DataController()
    private init() {}
    
    private var items = ["apple", "orange", "guava"]
    
    var count: Int {
        return items.count
    }
    
    func getItem(at index: Int) -> String{
        let item = items[index]
        return item;
    }
    
    func addItem(item: String) {
        items.append(item)
    }
}
