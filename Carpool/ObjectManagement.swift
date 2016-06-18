//
//  ObjectManagement.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import Foundation

class ObjectManagement {

    static func createRequestObject(user: KiiUser, coordinate: KiiGeoPoint, datetime: NSDate, completionHandler: (object: KiiObject?, error: NSError?) -> Void){

        let bucket = Kii.bucketWithName("Requests")
        
        // Create an object with key/value pairs
        let object = bucket.createObject()
        object.setObject(user.userID, forKey: "requestorID")
        object.setObject(coordinate.latitude, forKey: "latitude")
        object.setObject(coordinate.longitude, forKey: "longtitude")
        
        object.setObject(NSNumber(double: datetime.timeIntervalSince1970), forKey: "datetime")
        
        // Save the object
        object.saveWithBlock { (object : KiiObject?, error : NSError?) -> Void in
            if (error != nil) {
                // Error handling
            }
            
            completionHandler(object: object, error: error)
        }
        
    }
    
    
    static func createResponseObject(requestID: String, requestUser: KiiUser, responseUser: KiiUser, completionHandler: (object: KiiObject?, error: NSError?) -> Void){
        
        let bucket = Kii.bucketWithName("Responses")

        // Create an object with key/value pairs
        let object = bucket.createObject()
        object.setObject(requestID, forKey: "requestID")
        object.setObject(responseUser.userID, forKey: "responseUserID")
        object.setObject(requestUser.userID, forKey: "requestUserID")
        object.setObject(RequestStatus.Active.rawValue, forKey: "status")
        
        // Save the object
        object.saveWithBlock { (object : KiiObject?, error : NSError?) -> Void in
            if (error != nil) {
                // Error handling
            }
            
            completionHandler(object: object, error: error)
        }
        
    
    }
    
}
