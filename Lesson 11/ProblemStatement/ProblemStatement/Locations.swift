//
//  Locations.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import Foundation
import CoreLocation

class Locations {
    let name: String
    let coords: CLLocationCoordinate2D
    
    init(_ name: String, _ coords: CLLocationCoordinate2D) {
        self.name = name
        self.coords = coords
    }
    
    func getName() -> String {
        return name
    }
    
    func getCoords() -> String {
        return "\(coords.latitude), \(coords.longitude)"
    }
}
