//
//  ViewController.swift
//  SampleProject01
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
	setupLocationManager()
        
    }
}

extension ViewController: CLLocationManagerDelegate {
    func setupLocationManager() {
        guard CLLocationManager.locationServicesEnabled(), CLLocationManager.significantLocationChangeMonitoringAvailable() else {
            print("Location service not supported")
            return
        }
        
        if (locationManager == nil) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startMonitoringSignificantLocationChanges()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse) {
            print("authorised")
            manager.startUpdatingLocation()
        } else {
            print("not authorised")
            manager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if error._code == CLError.denied.rawValue {
            print("didFailWithError denied")
            manager.stopUpdatingLocation()
        } else {
            print("didFailWithError \(error._code)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        print("coord: \(lastLocation?.coordinate), time: \(lastLocation?.timestamp)")
    }
}

