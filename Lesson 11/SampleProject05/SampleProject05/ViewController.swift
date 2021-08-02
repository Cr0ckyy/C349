//
//  ViewController.swift
//  SampleProject05
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let civicCenter = CLLocation(latitude: 1.435013, longitude: 103.786857)
        let region = MKCoordinateRegion(center: civicCenter.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        outMapView.setRegion(region, animated: true)
        
        let republicPolytechnic = CLLocation(latitude: 1.4437895, longitude: 103.784244)
        outMapView.centerCoordinate = republicPolytechnic.coordinate
        
        outMapView.mapType = .satellite
    }


}

