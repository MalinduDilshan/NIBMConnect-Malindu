//
//  HomeWorkDetailsViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit

class HomeWorkDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var noteTxt: UITextField!
    
    @IBOutlet weak var save: UIButton!
    
    var homeworkList: [Homework] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.save.backgroundColor = .clear
        self.save.layer.cornerRadius = 15
        self.save.layer.borderWidth = 2
        self.save.layer.borderColor = UIColor.white.cgColor
        

        // Do any additional setup after loading the view.
    }
    @IBAction func saveFunc(_ sender: Any) {
        
        if(titleTxt.text!.isEmpty){
            alert(message: "Homework Title Cannot be Empty")
        }
        else if(noteTxt.text!.isEmpty){
            alert(message: "Homework Note Cannot be Empty")
        }
        else{
            let homeWork = Homework(title: titleTxt.text, note: noteTxt.text)
            Homework.saveHomeWork(homeWork: homeWork)
            self.performSegue(withIdentifier: "backToHomeWork", sender: nil)
        }
    }
}
