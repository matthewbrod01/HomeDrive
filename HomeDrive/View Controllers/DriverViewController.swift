//
//  DriverViewController.swift
//  HomeDrive
//
//  Created by Kun Huang on 10/27/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class DriverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var db: DatabaseReference!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var tableView: UITableView!
    var locationManager = CLLocationManager()
    var tableArray: [[String: Any]] = [[:]]
    var currentLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getOwnerInfo()
        
    }
    
    func getOwnerInfo() {
        db = Database.database().reference().child("owners");
        let itemsRef = db.child("user_info")
        
        //observing the data changes
        itemsRef.observe(DataEventType.value, with: { (snapshot) in
            print(snapshot.value as Any)
            print("Testing")
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //iterating through all the values
                for booking in snapshot.children.allObjects as! [DataSnapshot] {
                    //print(booking)
                    //getting values
                    let bookingObject = booking.value as? [String: AnyObject]
                    
                    if bookingObject != nil {
                        self.tableArray.append(bookingObject!)
                        //self.addAnnotationAtAddress(address: bookingObject!["address"] as! String, title: "title")
                    }
                    //self.bookings.append((bookingObject ?? nil)!)
                    
                    //self.tableView.reloadData()
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        currentLocation = center
        let camera = GMSCameraPosition.camera(withLatitude: center.latitude, longitude: center.longitude, zoom: 15)
        
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
        let marker = GMSMarker(position: center)
        
        marker.map = mapView
        
        marker.title = "Current Location"
        locationManager.stopUpdatingLocation()
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        performSegue(withIdentifier: "gotodetails", sender: self)
    }
    
    func addMaker(coordinate: CLLocationCoordinate2D, title: String) {
        //let position = CLLocationCoordinate2D(latitude: 10, longitude: 10)
        let marker = GMSMarker(position: coordinate)
        marker.title = title
        marker.icon = UIImage(named: "parking")
        marker.map = mapView
    }
    
    func addAnnotationAtAddress(address: String, title: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let placemarks = placemarks {
                if placemarks.count != 0 {
                    let coordinate = placemarks.first!.location!
                    let marker = GMSMarker(position: coordinate.coordinate)
                    marker.title = title
                    marker.icon = UIImage(named: "parking")
                    marker.map = self.mapView
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParkingCell", for: indexPath) as! ParkingCell
        
        let owner = tableArray[indexPath.row]
        let address = owner["address"] as? String
        let name = owner["name"] as? String
        cell.addressLabel.text = address
        cell.nameLabel.text = name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "togodetails" {
            let destinationVC = segue.destination as! DetailsViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.owner = tableArray[indexPath.row]
                destinationVC.currentLocation = currentLocation
            }
        }
    }
    
}
