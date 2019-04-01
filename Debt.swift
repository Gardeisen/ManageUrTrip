//
//  Debt.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 01/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit


    
    extension Debt {
        
        public var price : Float { return self.pPrice}
        
        convenience init(price : Float, friend : Friend, transaction : Transaction){
            self.init(context: CoreDataManager.context)
            self.pPrice = price
            self.debtOf = friend
            self.debtTransaction = transaction
        }
    }


