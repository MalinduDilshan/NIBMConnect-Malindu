//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved. 
//

import UIKit
import LocalAuthentication
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var goToStudents: UIImageView!
    @IBOutlet weak var goToMyProfile: UIImageView!
    @IBOutlet weak var goToHomeWork: UIImageView!
    @IBOutlet weak var signOut: UIBarButtonItem!
    
    @IBOutlet weak var students: UILabel!
    @IBOutlet weak var profile: UILabel!
    @IBOutlet weak var homework: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.goToMyProfile.layer.borderWidth = 3
        self.goToMyProfile.layer.masksToBounds = false
        self.goToMyProfile.layer.borderColor = UIColor.black.cgColor
        self.goToMyProfile.layer.cornerRadius = goToMyProfile.frame.width/2
        self.goToMyProfile.clipsToBounds = true
        
        self.goToHomeWork.layer.borderWidth = 3
        self.goToHomeWork.layer.masksToBounds = false
        self.goToHomeWork.layer.borderColor = UIColor.black.cgColor
        self.goToHomeWork.layer.cornerRadius = goToMyProfile.frame.height/2
        self.goToHomeWork.clipsToBounds = true
    }
    
    @IBAction func goToStudentsFunc(_ sender: Any) {
        self.performSegue(withIdentifier: "showStudents", sender: nil)
    }
    
    @IBAction func goToMyProfileFunc(_ sender: Any) {
        let myContext = LAContext()
        let myLocalizedReasonString = "NiBM Connect"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.performSegue(withIdentifier: "showMyProfile", sender: nil)
                            
                        } else {
                            print(evaluateError?.localizedDescription as Any)
                        }
                    }
                }
            } else {
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            print("Sorry!!.. Could not evaluate policy.")
        }
    }
    
    @IBAction func goToHomeWorkFunc(_ sender: Any) {
        self.performSegue(withIdentifier: "showHomeWork", sender: nil)
    }
    
    @IBAction func signOutFunc(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        performSegue(withIdentifier: "showLogin", sender: nil)
    }
}
