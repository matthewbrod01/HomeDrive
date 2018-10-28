//
//  RegistrationViewController.swift
//  HomeDrive
//
//  Created by Amzad Chowdhury on 10/28/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var joinButton: UIButton!
    
    var db: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didRegister(_ sender: Any) {
        db = Database.database().reference().child("owners");
        let itemsRef = db.child("user_info")
        
        
        let ownerItem = [ "name": nameField.text,
                          "address": addressField.text,
                          "garagetype": typeField.text ]
        let ownerItemRef = itemsRef.child(nameField.text!.lowercased())
        ownerItemRef.setValue(ownerItem)
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
