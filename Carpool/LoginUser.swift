//
//  LoginUser.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

struct LoginUser{
    
    var email: String = ""
    var password : String = ""
    
    func isValid() -> Bool {
        return email != "" && password != ""
    }
    
}