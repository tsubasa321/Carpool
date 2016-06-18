//
//  CarpoolTests.swift
//  CarpoolTests
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import XCTest
@testable import Carpool

class CarpoolTests: XCTestCase {
    
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateInitialViewController() as! ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results. 
        
    }
    
    func testLogin() {
        
        var loginProvider = LoginProvider.None
        let user = LoginUser(email: "alvin@example.com", password: "pass")
        loginProvider = .Email(user)
        loginProvider.login(vc)
        
    }
    
    func testSignup() {
        
        let signupControl = Signup()
        signupControl.signup("alvin@example.com", password: "pass", delegate: vc)
    
    }
    
    func testCreateRequestObject(){
        
        /* Login */
        var loginProvider = LoginProvider.None
        let user = LoginUser(email: "alvin@example.com", password: "pass")
        loginProvider = .Email(user)
        loginProvider.login(vc)
        
        /* Create carpool request */
        let email = "alvin@example.com"
        KiiUser.findUserByEmail(email) { (user : KiiUser?, error : NSError?) -> Void in
            if error != nil {
                // Error handling
                print(error!.code)
                print("Error finding user")
                return
            }
            
            let latitude = 44.698921
            let longtitude = -63.665212
            
            let geoPoint = KiiGeoPoint(latitude: latitude, andLongitude: longtitude)
            let datetime = NSDate()
            print("Current UTC time is: \(datetime)")
            
            ObjectManagement.createRequestObject(user!, coordinate: geoPoint, datetime: datetime, completionHandler: { (object, error) in
                
                if(error != nil){
                    return
                }
                
                let dateValue = NSDate(timeIntervalSince1970: object?.getObjectForKey("datetime") as! Double)
                print("Current local time is: " + dateValue.formattedWith("yyyy-MM-dd, HH:mm a"))
                
            })
            
        }
    
    }
    
    func testDateConverstionFromKiiToNSDate() {
    
    
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
