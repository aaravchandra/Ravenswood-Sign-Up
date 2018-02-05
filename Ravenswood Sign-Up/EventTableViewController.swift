//
//  EventTableViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Mischa Nee on 2/4/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EventTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return EventTable.dequeueReusableCell(withIdentifier: "hinew")!
    }
    
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    var Event:EventData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        ref = Database.database().reference()
        
      
        refHandle = ref?.child("Events").child("Event1").observe(.value, with: { (snapshot) in
            if let OvrData = snapshot.value as? [String : String] {
                self.Event=EventData(Date: OvrData["Date"]!, Name: OvrData["Name"]!, Location: OvrData["Location"]!)
                print("Check")
            }
            
            
//            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        })


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var EventTable: UITableView! {
        didSet {
            EventTable.dataSource=self
            EventTable.delegate=self
        }
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
