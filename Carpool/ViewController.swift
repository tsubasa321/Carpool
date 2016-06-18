//
//  ViewController.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginProviderDelegate {
    
    var loginProvider = LoginProvider.None
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let user = LoginUser(email: "alvin@example.com", password: "pass")
        loginProvider = .Email(user)
        loginProvider.login(self)
        
    }
    
    func loginProvider(loginProvider: LoginProvider, didSuccess user: KiiUser){
        print("Success")
    }
    
    func loginProvider(loginProvider: LoginProvider, didError error: NSError?){
        print("\(error!.code)")
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

