//
//  SignInViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Austin-Caleb Flores on 10/20/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if (!(userEmail.text?.isEmpty)! && !(userPassword.text?.isEmpty)!){
            Auth.auth().signIn(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
                
                //Checks that user isn't nill
                if let u = user {
                    //user is found
                    self.errorMessage.isHidden = true;
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                } else {
                    //Error: check error and show message
                    self.errorMessage.text = "*Admin not found."
                    self.errorMessage.isHidden = false;
                }
            }
        } else {
            //Error: Missing field
            errorMessage.text = "*Please fill out all fields."
            errorMessage.isHidden = false;
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
