//
//  FriendSet.swift
//  ManageUrTrip
//
//  Created Marine on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class FriendSet: Sequence {
    
    var set : [Friend]
    
    init(){
        self.set = []
    }
    
    init(friend: [Friend]){
        self.set = friend
    }
    
    func makeIterator() -> ItFriendSet{
        return ItFriendSet(friends: self)
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
            found = ( self.set[i].pLastname == _title )
        }
        return found
    }
    
    public func indexOf(f : Friend) -> Int {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i] == f )
        }
        if(found){
            return i
        }else{
            return -1
        }
        
    }
    
    
    public func remove( friend : Friend){
        self.set.remove(at: self.indexOf(f: friend))
        
    }
    
    public func add(friend : Friend) {
        if(!contains(_title : friend.firstname)){
            self.set.append(friend);
        }
    }
    
}

class ItFriendSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : FriendSet
    
    init(friends : FriendSet){
        self.current_indice=0
        self.elementSet = friends
    }
    
    func next() -> Friend?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
    
}
