//
//  StudentDetailsViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit
import Kingfisher

class StudentDetailsViewController: UIViewController {

    var student:Student? = nil
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var mobile: UILabel!
    @IBOutlet weak var facebook: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.firstName.text = student?.firstName
        self.lastName.text = student?.lastName
        self.city.text = student?.city
        self.birthday.text = student?.birthDay
        self.mobile.text = student?.mobile
        self.facebook.text = student?.facebook
        let url = URL(string: student!.profileImage)
        profileImage.kf.setImage(with: url)
        
        
        self.profileImage.layer.borderWidth = 3
        self.profileImage.layer.masksToBounds = false
        self.profileImage.layer.borderColor = UIColor.black.cgColor
        self.profileImage.layer.cornerRadius = profileImage.frame.height/2
        self.profileImage.clipsToBounds = true
    }
}
