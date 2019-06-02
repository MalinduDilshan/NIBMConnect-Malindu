//
//  HomeWorkViewController.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit

class HomeWorkViewController: UIViewController {


    @IBOutlet weak var add: UIBarButtonItem!
    @IBOutlet weak var close: UIBarButtonItem!
    @IBOutlet weak var homeworkTableView: UITableView!
    
    var homeworkList: [Homework] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retriveUserDefaults()

        // Do any additional setup after loading the view.
        self.homeworkTableView.dataSource = self
        self.homeworkTableView.delegate = self
        
        homeworkTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func retriveUserDefaults(){
        if let arrayDetails = Homework.getHomeWork(){
            homeworkList = arrayDetails
        }
    }

    
    @IBAction func goToHomeWorkFunc(_ sender: Any) {
        self.performSegue(withIdentifier: "showHomeWorkDetails", sender: nil)
    }
    
    @IBAction func closeFunc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension HomeWorkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeWorkTableViewCell", for: indexPath) as! HomeWorkTableViewCell
        
        cell.homeWorkTitle.text! = homeworkList[indexPath.row].title!
        cell.homeaWorkDescription.text! = homeworkList[indexPath.row].note!
        return cell
    }
}
