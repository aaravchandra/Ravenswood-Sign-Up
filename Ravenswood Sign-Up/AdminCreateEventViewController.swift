//
//  AdminCreateEventViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Chandra Gnanasambandam on 5/20/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AdminCreateEventViewController: UIViewController, TimePickerDelegate {
    
//    var AllFieldsCompleted : Bool!
    var ButtonClicked : UIButton!
    
    
    
    @IBOutlet weak var SubmitButtonAdmin: UIButton!
    
    @IBOutlet weak var NameFieldAdmin: UITextField!
    
    @IBOutlet weak var DateFieldAdmin: UITextField!
    
    @IBOutlet weak var LocationFieldAdmin: UITextField!
    
    @IBOutlet weak var DescriptionFieldAdmin: UITextField!
    
    @IBOutlet weak var NameRepeatWarning: UILabel!
    
    @IBOutlet weak var TimeButton1: UIButton!
    
    @IBOutlet weak var TimeButton2: UIButton!
    
    @IBOutlet weak var TimeButton3: UIButton!

    
    
    
    
    var ref : DatabaseReference?
    var refHandle: DatabaseHandle?
    @IBAction func LookForNameRepeat(_ sender: Any)
        
        
        
    {
        var RepeatRecognition = false
        refHandle = ref?.child("Events").observe(.childAdded, with: { (snapshot) in
            if (self.NameFieldAdmin.text==snapshot.key) {
                
                self.NameRepeatWarning.isHidden=false
                RepeatRecognition = true
//                self.SubmitButtonAdmin.isHidden = true
                
            }
            else {
                if ( RepeatRecognition == false) {
                    self.NameRepeatWarning.isHidden=true
//                    self.SubmitButtonAdmin.isHidden = true
                }
            }
            
            
            
        })
    }
    
    @IBAction func SubmitPressed(_ sender: Any)
    {
        
        let Name = NameFieldAdmin.text
        
        let Date = DateFieldAdmin.text
        
        let Location = LocationFieldAdmin.text
        
        let Description = DescriptionFieldAdmin.text
        
        var Timeslots = [] as! [String]
        
        if (TimeButton1.titleLabel?.text != "Time") {

            Timeslots.append((TimeButton1.titleLabel?.text)!)
            
        }
            
            if (TimeButton2.titleLabel?.text != "Time") {
  
                Timeslots.append((TimeButton2.titleLabel?.text)!)
                
        }
                if (TimeButton3.titleLabel?.text != "Time") {
                    
              Timeslots.append((TimeButton3.titleLabel?.text)!)
        }
        
        
        if (Name != "" && Date != "" && Location != "") {
            self.ref?.child("Events").child(Name!).setValue(["Date":Date,"Location":Location,"Description":Description, "Timeslots":Timeslots])
//        AllFieldsCompleted = true
      
        } else {
            
            print("good")
//         AllFieldsCompleted =  false
        }
    }
    
    
    
    func DeleteTime() {
        
        ButtonClicked.setTitle("Time", for: .normal)
        
    }
    
    
    func TimePass(_ Time: Date?) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let myString = formatter.string(from: (Time as! Date) as Date)
        
        
        ButtonClicked.setTitle(myString, for: .normal)
    }
   
    override func viewDidLoad(){
        
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
   
        var ButtonClickedTitle = (sender as! UIButton)
        
    
        
       ButtonClicked = ButtonClickedTitle
        
        
        if let vc = segue.destination as? TImePicker {
            vc.delegate=self
        }
//        if let vc2 = segue.destination as? EventConfirmViewController {
//            vc2.NotDone = !AllFieldsCompleted
//        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

}
