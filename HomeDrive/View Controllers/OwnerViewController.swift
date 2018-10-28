//
//  OwnerViewController.swift
//  HomeDrive
//
//  Created by Amzad Chowdhury on 10/27/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit

class OwnerViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var bookings: [[String: Any]] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.estimatedRowHeight = 127
        tableView.rowHeight = UITableView.automaticDimension
        
        fetchBookings()
    }
    
    func fetchBookings() {
        // code to get data from database
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath) as! BookingCell
        
        let booking = bookings[indexPath.row]
        let title = booking["title"] as! String
        let overview = booking["overview"] as! String
        //cell.driverLabel.text = title
        //cell.licenseLabel.text = license
        //cell.startTimeLabel = startTime
        //cell.endTimeLabel = endTime
        //cell.durationLabel = duration
        //cell.ratingLabel = rating
        
        return cell;
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
