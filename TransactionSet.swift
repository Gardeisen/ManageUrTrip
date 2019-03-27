//
//  TransactionSet.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class TransactionSet: Sequence {
    
    var set : [Transaction]
    
    init(){
        self.set = []
    }
    
    init(transaction : [Transaction]){
        self.set = transaction
    }
    
    func makeIterator() -> ItTransactionSet{
        return ItTransactionSet(trans: self)
    }
    
    public func isEmpty() -> Bool {
        return self.set.isEmpty
    }
    
    public func count() -> Int {
        return self.set.count
    }
    
    public func contains(_title : String) -> Bool {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i].name == _title )
        }
        return found
    }
    
    public func indexOf(t : Transaction) -> Int {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i] == t )
        }
        if(found){
            return i
        }else{
            return -1
        }
        
    }
    
    public func remove( transaction : Transaction){
        self.set.remove(at: self.indexOf(t: transaction))
        
    }
    
    public func add(transaction : Transaction) {
        
    }
    
}

class ItTransactionSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : TransactionSet
    
    init(trans : TransactionSet){
        self.current_indice=0
        self.elementSet = trans
    }
    
    func next() -> Transaction? {
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
    }
    
}
