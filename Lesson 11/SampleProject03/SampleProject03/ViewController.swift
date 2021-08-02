//
//  ViewController.swift
//  SampleProject03
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let address = "Singapore 738964"
        CLGeocoder().geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks, placemarks.count != 0 else {
                return;
            }
            
            let placemark = placemarks[0]
            if let location = placemark.location {
                print("lat is \(location.coordinate.latitude)")
                print("long is \(location.coordinate.longitude)")
            }
        }
    }


}

