//
//  ViewController.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginProviderDelegate, SignupDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    var loginProvider = LoginProvider.None
    
    var signupControl = Signup()
    
    @IBAction func didTouchLogin(sender: AnyObject) {
        
        let user = LoginUser(email: "cindy@example.com", password: "pass")
        loginProvider = .Email(user)
        loginProvider.login(self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func signup(signup: Signup, didSuccess user: KiiUser){
    
        print("Sign up success")

    }
    func signup(signup: Signup, didError user: NSError?){
    
        print("Email already exists")
    
    }
    
    func loginProvider(loginProvider: LoginProvider, didSuccess user: KiiUser){
        
        print("Successfully logged in")
        self.performSegueWithIdentifier("login", sender: self)
        
    }
    
    func loginProvider(loginProvider: LoginProvider, didError error: NSError?){
        print("Failed to login, check your email and password")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //passwordTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

