//
//  TravelSet.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import Foundation

class TravelSet: Sequence {

    var set : [Travel]
    
    init(){
        self.set = []
    }
    
    init(travels : [Travel]){
        self.set = travels
    }

    func makeIterator() -> ItTravelSet{
        return ItTravelSet(pers: self)
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
            found = ( self.set[i].title == _title )
        }
        return found
    }
    
    public func indexOf(t : Travel) -> Int {
        
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

    
    public func remove( travel : Travel){
        self.set.remove(at: self.indexOf(t: travel))
        
    }
    
    public func add(travel : Travel) {
        if(!contains(_title : travel.title)){
            self.set.append(travel);
        }
    }
    
}

class ItTravelSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : TravelSet
    
    init(pers : TravelSet){
        self.current_indice=0
        self.elementSet = pers
    }
    
    func next() -> Travel?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
}

}
