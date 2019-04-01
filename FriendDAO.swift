//
//  FriendAO.swift
//  ManageUrTrip
//
//  Created by Marine on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import Foundation
import CoreData

class FriendDAO {
    
    static let request : NSFetchRequest<Friend> = Friend.fetchRequest()
    static func save(){
        CoreDataManager.save()
    }
    static func delete(friend : Friend){
        CoreDataManager.context.delete(friend)
    }
    static func fetchAll() -> [Friend]?{
        self.request.predicate = nil
        //changer le predicate pour que ca correspond aux participants d'un voyages precis d un travel
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
        
    }
    
    /// number of elements
    static var count: Int{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
    }
    
    
}
