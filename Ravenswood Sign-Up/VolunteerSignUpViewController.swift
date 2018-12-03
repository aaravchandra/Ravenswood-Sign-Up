//
//  ViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Mischa Nee on 1/28/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit
// ADDED-Imports
import Firebase
import FirebaseDatabase

class VolunteerSignUpViewController: UIViewController, UITextFieldDelegate {
    
    var NameOfEvent: String?
    var NoOfUsers:Int=0
    //    var NoofEvent: String?
   
    
    @IBOutlet weak var TimeButton1: UIButton!
    
    @IBOutlet weak var TimeButton2: UIButton!
    
    @IBOutlet weak var TimeButton3: UIButton!
    
    
    
    
    @IBOutlet weak var EventName: UILabel! {
        didSet {
            EventName.text=NameOfEvent
        }
    }
    
    @IBOutlet weak var NameField: UITextField! {
        didSet { NameField.placeholder="Name"
            
        }
        
    }
    
    @IBAction func TimeButton1Pressed(_ sender: UIButton) {
        
        
        if (sender.backgroundColor == UIColor.yellow) {
            sender.backgroundColor = UIColor.gray
            sender.setTitleColor(UIColor.white, for: .normal)
        }
        
        else {
        sender.backgroundColor = UIColor.yellow
        sender.setTitleColor(UIColor.black, for: .normal
        )
    
            
        }
    }
    
    @IBAction func TimeButton2Pressed(_ sender: UIButton) {
        
        if (sender.backgroundColor == UIColor.yellow) {
            sender.backgroundColor = UIColor.gray
            sender.setTitleColor(UIColor.white, for: .normal)
        }
            
        else {
            sender.backgroundColor = UIColor.yellow
            sender.setTitleColor(UIColor.black, for: .normal
            )
            
            
        }
    }
    
    @IBAction func TimeButton3Pressed(_ sender: UIButton) {
        
        
        if (sender.backgroundColor == UIColor.yellow) {
            sender.backgroundColor = UIColor.gray
            sender.setTitleColor(UIColor.white, for: .normal)
        }
            
        else {
            sender.backgroundColor = UIColor.yellow
            sender.setTitleColor(UIColor.black, for: .normal
            )
            
            
        }
        
        
    }
    
    
    @IBAction func NameTyped(_ sender: UITextField) {
        if let Name = sender.text {
            print(Name)
            
        }
        
    }
   
    
    
    
    @IBOutlet weak var TimeSlotField: UITextField! {
        didSet {
            TimeSlotField.placeholder="Look Down For Time Slots"
            TimeSlotField.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var PhoneNumberField: UITextField!{
        didSet { PhoneNumberField.placeholder = "Phone Number - Optional"}
    }
    
    @IBOutlet weak var EmailField: UITextField!{
        didSet { EmailField.placeholder = "Email Address - Optional"}}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextfield = textField.superview?.viewWithTag(textField.tag + 1 ) as? UITextField{
            nextfield.becomeFirstResponder()
            
        } else { textField.resignFirstResponder()}
        
        return false
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        
        // ADDED - Example write data
        
        let Name = NameField.text
        if (!(Name?.isEmpty)! && (TimeButton1.backgroundColor == UIColor.yellow || TimeButton2.backgroundColor == UIColor.yellow || TimeButton3.backgroundColor == UIColor.yellow))
        {
            
            
                let PhoneNumber = PhoneNumberField.text
                let Email = EmailField.text
                
            refHandle = ref?.child("Events").child(Name!).observe(.value, with: { (snapshot) in
                    let Info = snapshot.children.allObjects as! [DataSnapshot]
                    for Data in Info {
                        if (Data.key=="Sign-Ups"){
                          let Users = Data.children.allObjects as![DataSnapshot]
                            self.NoOfUsers = Users.count
                            
                            
                            
                        }
                    }
                    
                    
                })
                
        var TimeArray = [] as [String]
            
            if ( TimeButton1.backgroundColor == UIColor.yellow && TimeButton1.titleLabel?.text != "Button") {
                
                TimeArray.append((TimeButton1.titleLabel?.text)!)
               
            }
            
            if ( TimeButton2.backgroundColor == UIColor.yellow && TimeButton2.titleLabel?.text != "Button") {
                
                TimeArray.append((TimeButton2.titleLabel?.text)!)
                
            }
            if ( TimeButton3.backgroundColor == UIColor.yellow && TimeButton3.titleLabel?.text != "Button") {
                
                TimeArray.append((TimeButton3.titleLabel?.text)!)
                
            }
            
            self.ref?.child("Events").child(NameOfEvent!).child("Sign-Ups").child("User"+String(NoOfUsers)).setValue(["Name": Name, "Email":Email, "Phone":PhoneNumber, "Timeslots":TimeArray])
            
            
            }
        
        
        
        
    }
    
    // ADDED - reference vars
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.delegate=self
        PhoneNumberField.delegate=self
        EmailField.delegate=self
        
        NameField.tag=1
        PhoneNumberField.tag=4
        EmailField.tag=5
        
        // ADDED - init reference
        ref = Database.database().reference()
        
        refHandle = ref?.child("Events").child(NameOfEvent!).observe(.value, with: { (snapshot) in
            let Info = snapshot.children.allObjects as! [DataSnapshot]
            for Data in Info {
                if (Data.key=="Sign-Ups"){
                    let Users = Data.children.allObjects as![DataSnapshot]
                    self.NoOfUsers = Users.count
                    
                    
                    
                }
                
                if (Data.key=="Timeslots") {
                    let timeslots = Data.value as! [String]
                    
                    var ButtonArray = [self.TimeButton1, self.TimeButton2, self.TimeButton3]
                    
                    for (index, time) in timeslots.enumerated() {
                        
                        ButtonArray[index]?.setTitle(time, for: .normal)
                        
                        
                        
                    }
                }
                
            }
            
            
        })
    }
}
