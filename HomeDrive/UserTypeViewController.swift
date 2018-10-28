//
//  UserTypeViewController.swift
//  HomeDrive
//
//  Created by Matthew on 10/28/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class UserTypeViewController: UIViewController {
    
    @IBOutlet weak var homeownerButton: UIButton!
    @IBOutlet weak var driverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeownerButton.layer.cornerRadius = 5
        homeownerButton.layer.borderWidth = 1
        homeownerButton.layer.borderColor = UIColor.black.cgColor
        
        driverButton.layer.cornerRadius = 5
        driverButton.layer.borderWidth = 1
        driverButton.layer.borderColor = UIColor.black.cgColor
    }
    
    
    @IBAction func onTapHomeowner(_ sender: Any) {
        // TODO: link to ownerHomeVC
        print("HOMEOWNER")
    }
    
    @IBAction func onTapDriver(_ sender: Any) {
        // TODO: link to driverVC
        print("DRIVER")
    }
    
    @IBAction func onTapSignOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let chatViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(chatViewController, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
