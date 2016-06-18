//
//  EmailHelper.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

class EmailHelper {
    
    /* Login Blocking */
    func loginWithEmail(email: String, password: String, completionHandler: (user: KiiUser?, error: NSError?) -> Void) {
        
        do{
            try KiiUser.authenticateSynchronous(email, withPassword: password)
        }catch let error as NSError {
            // Error handling
            completionHandler(user: nil, error: error)
            return
        }
        
        completionHandler(user: KiiUser.currentUser(), error: nil)
   
    }
    
    func signupWithEmail(email: String, password: String, completionHandler: (user: KiiUser?, error: NSError?) -> Void){
        
        let user = KiiUser(emailAddress: email, andPassword: password)
        user.performRegistrationWithBlock { (user : KiiUser?, error : NSError?) -> Void in
            if (error != nil) {
                // Error handling
            }
            
            completionHandler(user: user, error: error)
            
        }    
    
    }
    
}