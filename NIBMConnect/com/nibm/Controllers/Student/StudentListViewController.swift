//
//  StudentListViewController.swift
//  NIBMConnect
//
///  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Kingfisher

class StudentListViewController: UIViewController {
    
    @IBOutlet weak var studentTableView: UITableView!
    @IBOutlet weak var close: UIBarButtonItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var ref: DatabaseReference!
    var studentList:[Student] = []
    var student:Student? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.ref.child("Student").observeSingleEvent(of: .value) { (snapshot) in
            
            self.activityIndicator.stopAnimating()
            
            //get user value
            let value = snapshot.value as? NSDictionary
            var students:[Student] = []
            
            print(snapshot)
            
            if snapshot.childrenCount > 0 {
                for student in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let studentObj = student.value as? [String:AnyObject]
                    
                    let std = Student(id: studentObj!["id"] as! String,
                                      firstName: studentObj!["firstName"] as! String,
                                      lastName: studentObj!["lastName"] as! String,
                                      facebook: studentObj!["facebook"] as! String,
                                      mobile: studentObj!["mobile"] as! String,
                                      birthDay: studentObj!["birthDay"] as! String,
                                      profileImage: studentObj!["profile"] as! String,
                                      city: studentObj!["city"] as! String)
                    
                    students.append(std)
                }
            }
            self.studentList = students
            self.studentTableView.reloadData()
        }
        
        self.studentTableView.delegate = self
        self.studentTableView.dataSource = self
        self.studentTableView.tableFooterView = UIView()
        
        
    }
    
    @IBAction func closeFunc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell:StudentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath)  as! StudentTableViewCell
        
        let student = studentList[indexPath.row]
        
        cell.firstName.text = "\(student.firstName) \(student.lastName)"
        cell.city.text = student.city
        
        let url = URL(string: self.studentList[indexPath.row].profileImage)
        cell.profileImage.kf.setImage(with: url)
        
        cell.profileImage.layer.borderWidth = 3
        cell.profileImage.layer.masksToBounds = false
        cell.profileImage.layer.borderColor = UIColor.black.cgColor
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
        cell.profileImage.clipsToBounds = true

         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        student = studentList[indexPath.row]
        performSegue(withIdentifier: "showStudentDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStudentDetails" {
            if let ViewController = segue.destination as? StudentDetailsViewController {
                ViewController.student = student
            }
        }
    }
}
