//
//  ViewController.swift
//  SampleProject06
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var outMapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outMapview.delegate = self
        let republicPolytechnic = CLLocation(latitude: 1.4437895, longitude: 103.784244)
        
        let point = MKPointAnnotation()
        point.coordinate = republicPolytechnic.coordinate
        point.title = "Republic Polytechnic"
        point.subtitle = "9 Woodlands Avenue 9, S738964"
        
        outMapview.addAnnotation(point)
        let region = MKCoordinateRegion(center: republicPolytechnic.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        outMapview.setRegion(region, animated: true)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotation == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}

