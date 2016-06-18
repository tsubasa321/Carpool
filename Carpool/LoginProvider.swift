//
//  LoginProvider.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

enum LoginProvider {
    case Facebook
    case Email(LoginUser)
    case None
    
    static var emailHelper = EmailHelper()
    
    func login(delegate: LoginProviderDelegate) {
        switch self {
        case let .Email(user) where user.isValid():
            loginWithEmail(user.email, password: user.password, delegate: delegate)
            break
            
        case let .Email(user) where !user.isValid():
            print("Please provide email and password")
            break
        default:
            break
        }
    }
    
    func loginWithEmail(email: String, password: String, delegate: LoginProviderDelegate){
        LoginProvider.emailHelper.loginWithEmail(email, password: password){ (user, error) in
            
            if error != nil{
                delegate.loginProvider(self, didError: error)
            }
            else{
                delegate.loginProvider(self, didSuccess: user!)
            }
            
        }
        
        
    }
    
}