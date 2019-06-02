//
//  Homework.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import Foundation

class Homework:Codable{

    var title:String?
    var note:String?
 
    init(title:String?, note:String?){
        self.title = title
        self.note = note
    }
    
    
    public static func saveHomeWork(homeWork:Homework){
        var retrivedHomeWorkArray:[Homework] = []
        
        if  let homeWorkData = UserDefaults.standard.data(forKey: "HOMEWORK"){
            retrivedHomeWorkArray = try! JSONDecoder().decode([Homework].self, from: homeWorkData)
        }
        
        
        if retrivedHomeWorkArray.count == 0 {
            
            var homeWorkArray = [Homework]()
            homeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(homeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "HOMEWORK")
        }else{
            
            retrivedHomeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(retrivedHomeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "HOMEWORK")
            
        }
        
        
    }
    
    public static func getHomeWork() -> [Homework]? {
        
        var homeWorkArray:[Homework] = []
        if let homeWorkData = UserDefaults.standard.data(forKey: "HOMEWORK"){
            homeWorkArray = try! JSONDecoder().decode([Homework].self, from: homeWorkData)
        }
        return homeWorkArray
    }
}
