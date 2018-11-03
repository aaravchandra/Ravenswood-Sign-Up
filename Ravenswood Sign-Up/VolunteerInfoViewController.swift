//
//  VolunteerInfoViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Chandra Gnanasambandam on 10/21/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit
import Firebase


class VolunteerInfoViewController: UIViewController {

    var Event: EventData?
    
    
    @IBOutlet weak var NameofEvent: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        var TimeArray = [Button1,Button2,Button3]
        
        
       
        
        refHandle = ref?.child("Events").child((Event?.Name)!).observe(.value, with: { (snapshot) in
        
            var timeslots = snapshot.childSnapshot(forPath: "Timeslots")
            var VolunteersInfo = snapshot.childSnapshot(forPath: "Sign-Ups")
            
            if VolunteersInfo.exists() {
                self.NameofEvent.text = (self.Event?.Name)! + ":" + "0"
            }
            else {
          var NoOfSignUps = VolunteersInfo.value as! NSDictionary
            
            self.NameofEvent.text = (self.Event?.Name)! + ":" + String (NoOfSignUps.count)  // + amount of sign ups
            
            }
                var TimeCount = 0
            
            
            for time in timeslots.value as! [String]{
    
              
                TimeArray[TimeCount]?.setTitle(time, for: .normal)
                
     TimeCount = TimeCount+1
            }
         
            
            
            while TimeCount < 3 {
                
                TimeArray[TimeCount]?.setTitle("Sorry, no time here", for: .normal)
             TimeCount = TimeCount+1
            }
            
        })
        
    }

    @IBAction func Button1Pressed(_ sender: UIButton) {
    }
    @IBAction func Button2Pressed(_ sender: UIButton) {
    }
    @IBAction func Button3Pressed(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
    
        
    
    
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
