//
//  Transaction.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

extension Transaction {
    
    public var name : String { return self.pName ?? "" }
    
    public var date : Date? {
        get{ return (self.pDate as Date?) }
        set{ self.pDate = (newValue as NSDate?) }
    }
    
    public var t_isSpent : Bool { return self.isSpent}
    
    public var t_price : Float { return self.pPrice}
    
    
    convenience init(name : String, price : Float){
        self.init(context: CoreDataManager.context)
        self.pName = name
        self.pPrice = price
    }
}
