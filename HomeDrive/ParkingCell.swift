//
//  ParkingCell.swift
//  HomeDrive
//
//  Created by Kun Huang on 10/27/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit

class ParkingCell: UITableViewCell {

    
    @IBOutlet weak var parkingImageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
