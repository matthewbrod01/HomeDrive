//
//  LoginViewController.swift
//  HomeDrive
//
//  Created by Matthew on 10/28/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signIn()
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
}
