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
        return Events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EventTable.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        if let EventCell = cell as? EventTableViewCell{
            let event = Events [indexPath.item]
            EventCell.Date.text = event.Date
            EventCell.Location.text = event.Location
            EventCell.Name.text = event.Name
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat  {
//        if indexPath.item==1 {
//            return CGFloat(150)
//
//
//        }
//
         return CGFloat(150)

    }
    
    
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    var Events:[EventData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        ref = Database.database().reference()
        
        for i in 1...3 {
            refHandle = ref?.child("Events").child("Event\(i)").observe(.value, with: { (snapshot) in
                if let OvrData = snapshot.value as? [String : String] {
                    self.Events.append(EventData(Date: OvrData["Date"]!, Name: OvrData["Name"]!, Location: OvrData["Location"]!))
                    self.EventTable.reloadData()
                }
            })
        }

        
        

//        refHandle = ref?.child("Events").child("Event1").observe(.value, with: { (snapshot) in
//            if let OvrData = snapshot.value as? [String : String] {
//                self.Event=EventData(Date: OvrData["Date"]!, Name: OvrData["Name"]!, Location: OvrData["Location"]!)
//                print("Check")
//            }

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
            EventTable.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
     // ADDED CODE
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 80
     }
     
    */

}
