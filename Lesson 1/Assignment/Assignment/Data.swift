//
//  Data.swift
//  Assignment
//
//  Created by 19013345 Ju Long on 19/4/21.
//

import Foundation
class Data {
    static let sharedInstance = Data()
    private init() {}
    
    var names = ["something"]
    var imagenames = ["something.png"]
    
    func getData(index: Int) -> Array<String> {
        var array: Array<String> = []
        let name = names[index]
        let imagename = imagenames[index]
        array.append(name)
        array.append(imagename)
        return array
    }
}
