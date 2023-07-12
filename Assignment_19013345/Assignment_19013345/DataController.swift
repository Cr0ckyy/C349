//
//  DataController.swift
//  Assignment_19013345
//
//  Created by day4 on 15/2/21.
//

import Foundation
class Product {
    var productName: [String] = []
    var productColor: [String] = []
    var productPrice: [Double] = []
    
    func getProductName(_ num: Int) -> String {
        return productName[num]
    }
    
    func getProductColor(_ num: Int) -> String {
        return productColor[num]
    }
    
    func getProductPrice(_ num: Int) -> Double {
        return productPrice[num]
    }
    
    func addProduct(_ name: String,_ color: String,_ price: Double) {
        productName.append(name)
        productColor.append(color)
        productPrice.append(price)
    }
}
