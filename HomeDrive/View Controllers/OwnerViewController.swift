//
//  OwnerViewController.swift
//  HomeDrive
//
//  Created by Amzad Chowdhury on 10/27/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import Firebase

class OwnerViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    var db: DatabaseReference!
    @IBOutlet weak var tableView: UITableView!
    
    var bookings: [[String: Any]] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        //tableView.estimatedRowHeight = 127
        //tableView.rowHeight = UITableView.automaticDimension
        
        //let ref = Database.database().reference(withPath: "bookings")
        
        //FirebaseApp.configure()
        
        db = Database.database().reference().child("owners");
        let itemsRef = db.child("bookings")
        
        //observing the data changes
        itemsRef.observe(DataEventType.value, with: { (snapshot) in
            print(snapshot.value as Any)
            print("Testing")
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                print("Testing")
                
                //clearing the list
                self.bookings.removeAll()
                
                //iterating through all the values
                for booking in snapshot.children.allObjects as! [DataSnapshot] {
                    //print(booking)
                    //getting values
                    let bookingObject = booking.value as? [String: AnyObject]
                    self.bookings.append((bookingObject ?? nil)!)

                    self.tableView.reloadData()
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
        })
        
        //fetchBookings()
    }
    /**
    func fetchBookings() {
        self.bookings.removeAll()
        
        //iterating through all the values
        for booking in snapshot.children.allObjects as! [DataSnapshot] {
            print(booking)
            //getting values
            let bookingObject = booking.value as? [String: AnyObject]
            // let name  = bookingObject?["name"]
            //let license  = bookingObject?["licenseplate"]
            //let startTime = bookingObject?["startTime"]
            //let endTime = bookingObject?["endTime"]
            //let duration = bookingObject?["duration"]
            
            self.bookings.append(bookingObject!)
            
            self.tableView.reloadData()
        }
        
        //reloading the tableview
        self.tableView.reloadData()
        
    } **/

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath) as! BookingCell
        
        let booking = bookings[indexPath.row]
        let title = booking["name"] as! String
        let overview = booking["licenseplate"] as! String
        let startTime = booking["startTime"] as! String
        let endTime = booking["endTime"] as! String
        let duration = booking["duration"] as! String
        
        cell.driverLabel.text = title
        cell.licenseLabel.text = overview
        cell.startTimeLabel.text = startTime
        cell.endTimeLabel.text = endTime
        cell.durationLabel.text = duration
        //cell.ratingLabel.text = rating
        
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
