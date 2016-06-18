//
//  SignupDelegate.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

protocol SignupDelegate {
    func signup(signup: Signup, didSuccess user: KiiUser)
    func signup(signup: Signup, didError user: NSError?)
}