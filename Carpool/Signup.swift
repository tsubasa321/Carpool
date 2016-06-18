//
//  Signup.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

class Signup{
    
    static var emailHelper = EmailHelper()

    func signup(email: String, password: String, delegate: SignupDelegate){
    
        Signup.emailHelper.signupWithEmail(email, password: password) { (user, error) in
            
            if(error != nil){
                delegate.signup(self, didError: error)
            }else{
                delegate.signup(self, didSuccess: user!)
            }
            
        }
        
    }

}
