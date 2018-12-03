//
//  TImePicker.swift
//  Ravenswood Sign-Up
//
//  Created by Chandra Gnanasambandam on 6/17/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

protocol TimePickerDelegate : class {
    func TimePass(_ Time: Date? )
    func DeleteTime ()
}

class TImePicker: UIViewController {

    @IBOutlet weak var DatePicker: UIDatePicker!
    
     weak var delegate: TimePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BackFunction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func ConfirmFunction(_ sender: Any) {
        print(DatePicker.date);
        
        delegate?.TimePass(DatePicker.date)
        
        dismiss(animated: true, completion: nil)
    
    
    
    
    
    }
    @IBAction func DeleteFunction(_ sender: Any) {
    
        delegate?.DeleteTime()
        
     dismiss(animated: true, completion: nil)
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
