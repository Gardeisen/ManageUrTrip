//
//  TravelDAO.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import Foundation
import CoreData

class TravelDAO{
    
    static let request : NSFetchRequest<Travel> = Travel.fetchRequest()
    static func save(){
        CoreDataManager.save()
    }
    static func delete(travel: Travel){
        CoreDataManager.context.delete(travel)
    }
    static func fetchAll() -> [Travel]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
            /*let t1 : Travel  = Travel(t : "turquie")
            let t2 : Travel  = Travel(t : "alaska")
            
            var tt : [Travel] = []
            tt.append(t1)
            tt.append(t2)
            
            return tt*/
            
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
