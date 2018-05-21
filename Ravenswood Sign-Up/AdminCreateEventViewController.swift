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

class AdminCreateEventViewController: UIViewController {

    @IBOutlet weak var SubmitButtonAdmin: UIButton!
    
    @IBOutlet weak var NameFieldAdmin: UITextField!
    
    @IBOutlet weak var DateFieldAdmin: UITextField!
    
    @IBOutlet weak var LocationFieldAdmin: UITextField!
  
    @IBOutlet weak var DescriptionFieldAdmin: UITextField!
    
    @IBOutlet weak var NameRepeatWarning: UILabel!
    var ref : DatabaseReference?
    var refHandle: DatabaseHandle?
    @IBAction func LookForNameRepeat(_ sender: Any)
        
    {
        var RepeatRecognition = false
        refHandle = ref?.child("Events").observe(.childAdded, with: { (snapshot) in
            if (self.NameFieldAdmin.text==snapshot.key) {
              
                self.NameRepeatWarning.isHidden=false
              RepeatRecognition = true
                self.SubmitButtonAdmin.isHidden = true
                
               
            }
            else {
                if ( RepeatRecognition == false) {
                    self.NameRepeatWarning.isHidden=true
 self.SubmitButtonAdmin.isHidden = false
                }
            }
            
            
            
        })
    }
    
    @IBAction func SubmitPressed(_ sender: Any)
    
    {
        
        var Name = NameFieldAdmin.text
    
        var Date = DateFieldAdmin.text
        
        var Location = LocationFieldAdmin.text

        var Description = DescriptionFieldAdmin.text
    
        self.ref?.child("Events").child(Name!).setValue(["Date":Date,"Location":Location,"Description":Description])
    }
    
    
    
    override func viewDidLoad(){
    
      super.viewDidLoad()
     ref = Database.database().reference()
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