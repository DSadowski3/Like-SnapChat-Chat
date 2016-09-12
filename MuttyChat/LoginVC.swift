//
//  LoginVC.swift
//  MuttyChat
//
//  Created by Dominik Sadowski on 9/11/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var emailField: RoundTextField!
    @IBOutlet var passwordField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginPressed(_ sender: AnyObject) {
        if let email = emailField.text, let pass = passwordField.text , (email.characters.count > 0 && pass.characters.count > 0) {
            //Call the login service
            AuthService.instance.login(email: email, password: pass, onComplete: { (errMsg, data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "ErrorAuthentication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            })
            
        }else{
            let alert = UIAlertController(title: "Username and Password required", message: "You must enter both a username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
}
