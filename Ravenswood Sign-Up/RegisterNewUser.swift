//
//  RegisterNewUser.swift
//  Ravenswood Sign-Up
//
//  Created by Austin-Caleb Flores on 10/31/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterNewUser: UIViewController {

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func RegisterUser(_ sender: UIButton) {
        if (!(emailField.text?.isEmpty)! && !(passwordField.text?.isEmpty)!){
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
                //Checks that user isn't nill
                if let u = user {
                    //user is found
                    self.errorMessage.isHidden = true;
                    self.navigationController?.popViewController(animated: true)
                } else {
                    //Error: check error and show message
                    self.errorMessage.text = "Please ensure this is a proper email."
                    self.errorMessage.isHidden = false;
                }
            }
        } else {
            //Error: Missing field
            errorMessage.text = "*Please fill out all fields."
            errorMessage.isHidden = false;
        }
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
