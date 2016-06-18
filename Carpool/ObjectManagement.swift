//
//  ObjectManagement.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

class ObjectManagement {

    static func createObject(){
    
        let bucket = Kii.bucketWithName("Requests")
        
        // Create an object with key/value pairs
        let object = bucket.createObject()
        object.setObject(NSNumber(int: 987), forKey: "requestorID")
        object.setObject("easy", forKey: "mode")
        object.setObject(NSNumber(bool: false), forKey: "premiumUser")
        
        // Save the object
        object.saveWithBlock { (object : KiiObject?, error : NSError?) -> Void in
            if (error != nil) {
                // Error handling
                return
            }
        }
    }
    
}
