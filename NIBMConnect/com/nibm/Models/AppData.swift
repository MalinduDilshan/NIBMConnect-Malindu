//
//  AppData.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import Foundation

//User Defaults
class AppData {
    
    static let defaults = UserDefaults.standard
    
    let defaults = UserDefaults.standard
    
    // storing user deaults
    static func storeData (data: String?, key: UserData!){
        defaults.setValue(data, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    // a get data function that gives a string return
    static func getData (key: UserData!) -> String {
        if let userData = defaults.string(forKey: key.rawValue) {
            return userData
        }
        else
        {
            return "Key not found!"
        }
    }
}

enum UserData: String {
    case username = "USERNAME"
    case userID = "USERID"
}
