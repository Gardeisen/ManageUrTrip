//
//  Friend.swift
//  ManageUrTrip
//
//  Created by Marine on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//
import Foundation
import UIKit

extension Friend {
    
    public var firstname : String { return self.pFirstname ?? "" }
    
    public var total_i_payed : Float {
        get { return self.pTotal_I_payed }
        set { self.pTotal_I_payed = (newValue as Float) }
    }
    
    public var total_costs : Float {
        get { return self.pTotalCosts}
        set { self.pTotalCosts = (newValue as Float) }
    }
    
    public var lastname : String { return self.pLastname ?? "" }
    
    public var fullname : String { return "\(self.firstname) \(self.lastname)" }
    
    public var end : Date? {
        get{ return (self.pDeparture as Date?) }
        set{ self.pDeparture = (newValue as NSDate?) }
    }
    
    public var beginning : Date? {
        get{ return (self.pArrival as Date?) }
        set{ self.pArrival = (newValue as NSDate?) }
    }
    
    convenience init(firstname : String, lastname : String){
        self.init(context: CoreDataManager.context)
        self.pFirstname = firstname
        self.pLastname = lastname
        self.pTotal_I_payed = 0
        self.pDeparture = nil
        self.pArrival = nil
        
    }
    
}
