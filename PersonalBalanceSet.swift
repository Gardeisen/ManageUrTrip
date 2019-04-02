//
//  PersonalBalanceSet.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class PersonalBalanceSet : Sequence {
    
    var set : [PersonalBalance]
    
    init(){
        self.set = []
    }
    
    init(balance : [PersonalBalance]){
        self.set = balance
    }
    
    func makeIterator() -> ItPersonalBalanceSet {
        return ItPersonalBalanceSet(balance: self)
        //return ItPersonalBalanceSet(balance : self)
    }
    
    public func isEmpty() -> Bool {
        return self.set.isEmpty
    }
    
    public func count() -> Int {
        return self.set.count
    }
    
    public func contains(_title : String) -> Bool {
        
        //
        return false
    }
    
    public func indexOf(b : PersonalBalance) -> Int {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i] == b )
        }
        if(found){
            return i
        }else{
            return -1
        }
        
    }
    
    
    public func remove(balance : PersonalBalance){
        self.set.remove(at: self.indexOf(b: balance))
        
    }
    
    public func add(balance : PersonalBalance) {
        if(!contains(_title : balance.fullname)){
            self.set.append(balance);
        }
    }
    
}

class ItPersonalBalanceSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : PersonalBalanceSet
    
    init(balance : PersonalBalanceSet){
        self.current_indice=0
        self.elementSet = balance
    }
    
    func next() -> PersonalBalance?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
}

