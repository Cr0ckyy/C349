//
//  ViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var outMapView: MKMapView!
    var locationManager: CLLocationManager!
    var location: [Locations]!
    var selected: Locations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLocationManager()
        outMapView.delegate = self
        outMapView.showsUserLocation = true
        
        if location?.count ?? 0 > 0 {
            for i in location {
                let point = MKPointAnnotation()
                point.coordinate = i.coords
                point.title = i.getName()
                point.subtitle = i.getCoords()
                
                outMapView.addAnnotation(point)
            }
            
            let region = MKCoordinateRegion(center: location[location.count-1].coords, latitudinalMeters: 500, longitudinalMeters: 500)
            outMapView.setRegion(region, animated: true)
        }
        
        if selected != nil {
            let region = MKCoordinateRegion(center: selected!.coords, latitudinalMeters: 500, longitudinalMeters: 500)
            outMapView.setRegion(region, animated: true)
        }
    }
    
    
}

extension ViewController: CLLocationManagerDelegate {
    func setupLocationManager() {
        guard CLLocationManager.locationServicesEnabled(), CLLocationManager.significantLocationChangeMonitoringAvailable() else {
            print("Location services not supported")
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
        let lastLocation = locations.last!
        print("coord: \(lastLocation.coordinate), time: \(lastLocation.timestamp)")
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}
