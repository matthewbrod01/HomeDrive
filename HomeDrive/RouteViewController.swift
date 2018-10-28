//
//  RouteViewController.swift
//  HomeDrive
//
//  Created by Kun Huang on 10/28/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import GoogleMaps

class RouteViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 40.737170, longitude: -73.824980, zoom: 15)
        mapView.camera = camera
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.737170, longitude: -73.824980)
        marker.title = "location1"
        marker.map = mapView
        
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 40.676690, longitude: -73.777720)
        marker1.title = "location2"
        marker1.map = mapView
        
        drawPath()
    }
    

    func drawPath() {
        let origin = CLLocationCoordinate2D(latitude: 40.737170, longitude: -73.824980)
        let destination = CLLocationCoordinate2D(latitude: 40.676690, longitude: -73.777720)
    
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin.latitude),\(origin.longitude)&destination=\(destination.latitude),\(destination.longitude)&mode=driving&key=AIzaSyBc3hRaxJ4vFVlpL5ot153TyJg9jgVT0MM") else {
            return
        }
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                let routes = json["routes"] as! NSArray
                
                OperationQueue.main.addOperation {
                    for route in routes {
                        let routeOverviewPolyline:NSDictionary = (route as! NSDictionary).value(forKey: "overview_polyline") as! NSDictionary
                        let points = routeOverviewPolyline.object(forKey: "points")
                        let path = GMSPath.init(fromEncodedPath: points! as! String)
                        let polyline = GMSPolyline.init(path: path)
                        polyline.strokeWidth = 3
                        polyline.strokeColor = UIColor.red
                        
                        let bounds = GMSCoordinateBounds(path: path!)
                        self.mapView!.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))
                        
                        polyline.map = self.mapView
                        break
                    }
                }
                
            }
            
        }
        task.resume()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
