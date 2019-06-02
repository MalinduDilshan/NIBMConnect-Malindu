//
//  LoginViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{
    
   
    @IBOutlet weak var usermail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var forget: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        self.signin.backgroundColor = .clear
        self.signin.layer.cornerRadius = 15
        self.signin.layer.borderWidth = 2
        self.signin.layer.borderColor = UIColor.white.cgColor
        
        self.forget.tintColor = UIColor.white
    }
    
    //FireBase E-mail Login
    @IBAction func customSignIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.usermail.text!, password: self.password.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            if error != nil {
                let alert = UIAlertController(title: "Login Error!", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                strongSelf.present(alert, animated: true, completion: nil)
            } else {
                strongSelf.performSegue(withIdentifier: "showHome", sender: nil)
                AppData.storeData(data: user!.user.displayName, key: UserData.username)
            }
            
            // ...
        }
    }
    
    //Google Login
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                print(error)
                let alert = UIAlertController(title: "Login Error!", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }

            self.performSegue(withIdentifier: "showHome", sender: nil)
            AppData.storeData(data: authResult!.user.displayName, key: UserData.username)
            
            print(authResult!.user.email!)
            print(authResult!.user.displayName as Any)
        }
        
    }
    
    
    @IBAction func forgetPassword(_ sender: Any) {
        self.performSegue(withIdentifier: "showForgetPassword", sender: nil)
    }
}
