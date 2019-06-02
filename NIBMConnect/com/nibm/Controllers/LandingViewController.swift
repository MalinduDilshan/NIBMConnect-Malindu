//
//  LandingViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LandingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AppTempData.userHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.performSegue(withIdentifier: "showLogin", sender: nil)
            } else {
                self.performSegue(withIdentifier: "showHome", sender: nil)
            }
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        AppTempData.userHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
                // ...
                
        }
    }
}
