//
//  DetailsViewController.swift
//  HomeDrive
//
//  Created by Kun Huang on 10/28/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var parkingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var garageLabel: UILabel!
    var owner: [String: Any] = [:]
    var currentLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = owner["name"] as? String
        addressLabel.text = owner["address"] as? String
        garageLabel.text = owner["garagetype"] as? String
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoroute" {
            let destinationVC = segue.destination as! RouteViewController
            destinationVC.owner = owner
            destinationVC.currentLocation = currentLocation
        }
    }
    
}
