//
//  PersonalBalance.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 01/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

extension PersonalBalance {

    public var value : Float { return self.pValue}
    
    //fullname of the person that has a debt with me
    public var fullname : String { return self.pFullname ?? ""}
    
    
    convenience init(fullname : String, value : Float){
        self.init(context: CoreDataManager.context)
        self.pFullname = fullname
        self.pValue = value
    }
    
}
