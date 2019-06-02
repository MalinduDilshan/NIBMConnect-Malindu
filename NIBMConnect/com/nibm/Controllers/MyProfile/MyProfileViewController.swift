//
//  MyProfileViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var close: UIBarButtonItem!
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.profilePic.layer.borderWidth = 1
        self.profilePic.layer.masksToBounds = false
        self.profilePic.layer.borderColor = UIColor.black.cgColor
        self.profilePic.layer.cornerRadius = profilePic.frame.height/2
        self.profilePic.clipsToBounds = true
    }
    
    @IBAction func closeFunc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
