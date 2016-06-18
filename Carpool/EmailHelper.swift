//
//  EmailHelper.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

class EmailHelper {
    
    func loginWithEmail(email: String, password: String, completionHandler: (user: KiiUser?, error: NSError?) -> Void) {

        KiiUser.authenticate(email, withPassword: password) { (user : KiiUser?, error : NSError?) -> Void in
            if (error != nil) {
                
                // Error handling
                if(error?.code == 302){
                    print("Invalid email and password")
                }

            }
            
            completionHandler(user: user, error: error)
            
        }
   
    }
    
    func signupWithEmail(email: String, password: String, completionHandler: (user: KiiUser?, error: NSError?) -> Void){
        
        let user = KiiUser(emailAddress: email, andPassword: password)
        user.performRegistrationWithBlock { (user : KiiUser?, error : NSError?) -> Void in
            if (error != nil) {
                // Error handling
                print("Email already exists")
            }
            
            completionHandler(user: user, error: error)
            
        }    
    
    }
    
}