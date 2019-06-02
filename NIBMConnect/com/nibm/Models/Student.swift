//
//  Student.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import Foundation

class Student {
    
    var id:String
    var firstName:String
    var lastName:String
    var facebook:String
    var mobile:String
    var birthDay:String
    var profileImage:String
    var city:String
    
    init(id:String, firstName:String, lastName:String, facebook:String, mobile:String, birthDay:String, profileImage:String, city:String) {
        
        self.id  = id
        self.firstName = firstName
        self.lastName = lastName
        self.facebook = facebook
        self.mobile = mobile
        self.birthDay = birthDay
        self.profileImage = profileImage
        self.city = city
    }
}
