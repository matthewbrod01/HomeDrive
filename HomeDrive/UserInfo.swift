//
//  UserInfo.swift
//  HomeDrive
//
//  Created by Kun Huang on 10/28/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation

class UserInfo {
    var name: String?
    var address: String?
    var lat: Double?
    var long: Double?
    var garageType: String?
    
    init(dictionary: [String: Any]) {
        
        name = dictionary["name"] as? String
        address = dictionary["address"] as? String
        garageType = dictionary["garagetype"] as? String
        lat = dictionary["latitude"] as? Double
        long = dictionary["longitude"] as? Double
    }
}
