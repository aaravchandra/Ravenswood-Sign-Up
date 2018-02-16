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

    @IBOutlet weak var NameField: UITextField! {
        didSet { NameField.placeholder="Name"
            
        }
        
    }
    @IBAction func NameTyped(_ sender: UITextField) {
        if let Name = sender.text {
            print(Name)
            
        }
        
    }
    @IBOutlet weak var DateField: UITextField! {
        didSet { DateField.placeholder="Date"}}
    
    
    
    @IBOutlet weak var TimeSlotField: UITextField! {
        didSet { TimeSlotField.placeholder="Time Slot"}
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
        self.ref?.child("Users").child("User2").setValue(["Name": "Natya", "Email":"aaravc9@keysschool.org", "Phone":"650-274-4630"])
        
        if let Name = NameField.text {
            print("Name:\(Name)" )
        }
        
        if let Date = DateField.text {
            print("Date:\(Date)" )
        }
        if let TimeSlot = TimeSlotField.text {
            print("Time Slot:\(TimeSlot)" )
        }
        if let PhoneNumber = PhoneNumberField.text {
            print("Phone Number:\(PhoneNumber)" )
        }
        if let Email = EmailField.text {
            print("Email Address:\(Email)" )
        }
    }
    
    // ADDED - reference vars
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.delegate=self
        DateField.delegate=self
        TimeSlotField.delegate=self
        PhoneNumberField.delegate=self
        EmailField.delegate=self
        
        NameField.tag=1
        DateField.tag=2
        TimeSlotField.tag=3
        PhoneNumberField.tag=4
        EmailField.tag=5
        
        // ADDED - init reference
        ref = Database.database().reference()
        
        // ADDED - template code for data listener
        refHandle = ref?.child("users").observe(.childAdded, with: { (snapshot) in
            //let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            // ...
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

