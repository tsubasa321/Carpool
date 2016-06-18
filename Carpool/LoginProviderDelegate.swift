//
//  LoginProviderDelegate.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

protocol LoginProviderDelegate {
    func loginProvider(loginProvider: LoginProvider, didSuccess user: KiiUser)
    func loginProvider(loginProvider: LoginProvider, didError user: NSError?)
}