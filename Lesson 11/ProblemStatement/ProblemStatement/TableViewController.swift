//
//  TableViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 2/8/21.
//

import UIKit
import CoreLocation

class TableViewController: UITableViewController {
    
    var locationManager: CLLocationManager!
    var location: CLLocation!
    var list_of_coords: [Locations] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
        performSegue(withIdentifier: "send", sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list_of_coords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        if let title = cell.textLabel,
           let subtitle = cell.detailTextLabel {
            title.text = list_of_coords[indexPath.row].getName()
            subtitle.text = list_of_coords[indexPath.row].getCoords()
        }

        return cell
    }
     
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
     
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
     
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
     
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return false
    }
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let nc = segue.destination as! UINavigationController
        let vc = nc.topViewController as! ViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            vc.selected = list_of_coords[indexPath.row]
        }
        vc.location = list_of_coords
    }
    
    @IBAction func addLocation(_ sender: UIBarButtonItem) {
        guard location != nil else {
            return
        }
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            guard let placemarks = placemarks, placemarks.count != 0 else {
                return
            }
            
            let placemark = placemarks[0]
            let newLocation = Locations("\(placemark.name ?? "No Value")", self.location.coordinate)
            
            for i in self.list_of_coords {
                if (i.getName() == newLocation.getName()) {
                    return
                }
            }
            
            self.list_of_coords.append(newLocation)
            self.tableView.reloadData()
            self.performSegue(withIdentifier: "send", sender: self)
        }
    }
}

extension TableViewController: CLLocationManagerDelegate {
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
        location = locations.last!
        print("coord: \(location.coordinate), time: \(location.timestamp)")
    }
}
