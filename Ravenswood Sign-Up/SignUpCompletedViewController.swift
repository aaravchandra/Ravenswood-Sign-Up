//
//  SignUpCompletedViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Chandra Gnanasambandam on 12/2/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class SignUpCompletedViewController: UIViewController {

    @IBAction func CompletedButton(_ sender: Any) {
        let navigationController = self.presentingViewController as? UINavigationController
        
        
        self.dismiss(animated: false) {
           let _ = navigationController!.popToRootViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
