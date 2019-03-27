//
//  Travel.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import Foundation

extension Travel{
    
    public var title : String { return self.pTitle ?? "" }
    
    public var end : Date? {
        get{ return (self.pEnd as Date?) }
        set{ self.pEnd = (newValue as NSDate?) }
    }

    public var beginning : Date? {
        get{ return (self.pBeginning as Date?) }
    }
    
    convenience init(t : String){
        self.init(context: CoreDataManager.context)
        self.pTitle = t
    }
    
    
    
    //image of travel has to be handle
}
