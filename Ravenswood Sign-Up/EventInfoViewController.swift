//
//  EventInfoViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Chandra Gnanasambandam on 9/23/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {

    var Event: EventData?
    @IBOutlet weak var Date: UILabel!
    
    @IBOutlet weak var Timeslots: UILabel!
    
    @IBOutlet weak var Location: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var Name: UILabel!
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Name.text = Event?.Name
        Date.text = "Date: " + (Event?.Date)!
        Location.text = "Location: " + (Event?.Location)!
        Description.text = "Description: " + (Event?.Description)!

        Timeslots.text = "Time Slots: " + (Event?.Timeslots)!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OvrSegue"{
            if let vc = segue.destination as? VolunteerSignUpViewController {
              vc.NameOfEvent = Event?.Name
            }
        }

    }

}
