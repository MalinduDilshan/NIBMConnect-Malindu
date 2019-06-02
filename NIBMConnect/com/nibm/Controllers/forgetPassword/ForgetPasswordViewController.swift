//
//  ForgetPasswordViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.submit.backgroundColor = .clear
        self.submit.layer.cornerRadius = 15
        self.submit.layer.borderWidth = 2
        self.submit.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func submitFunc(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: email.text!) { (error) in
            if error == nil {
                self.alert(message: "Please check your E mail")
                self.email.text! = ""
                return
            }
            else{
                self.alert(message: "Rest password exceed limit")
            }
        }
    }
}
