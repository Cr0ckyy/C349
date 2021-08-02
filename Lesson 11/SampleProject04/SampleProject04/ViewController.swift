//
//  ViewController.swift
//  SampleProject04
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let location: CLLocation = CLLocation(latitude: 1.4437895, longitude: 103.784244)
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            guard let placemarks = placemarks, placemarks.count != 0 else {
                return
            }
            let placemark = placemarks[0]
            let name = placemark.name ?? ""
            let streetAddress1 = placemark.subThoroughfare ?? ""
            let streetAddress2 = placemark.thoroughfare ?? ""
            let country = placemark.country ?? ""
            let postalCode = placemark.postalCode ?? ""
            
            print("name is \(name)")
            print("streetAddress1 is \(streetAddress1)")
            print("streetAddress2 is \(streetAddress2)")
            print("country is \(country)")
            print("postalCode is \(postalCode)")
            
        }
    }


}

