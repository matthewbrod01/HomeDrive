//
//  BookingCell.swift
//  HomeDrive
//
//  Created by Amzad Chowdhury on 10/27/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit

class BookingCell: UITableViewCell {
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
