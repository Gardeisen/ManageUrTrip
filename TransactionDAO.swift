//
//  TransactionDAO.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import Foundation
import CoreData

class TransactionDAO {
    
    static let request : NSFetchRequest<Transaction> = Transaction.fetchRequest()
    static func save(){
        CoreDataManager.save()
    }
    static func delete(transaction: Transaction){
        CoreDataManager.context.delete(transaction)
    }
    static func fetchAll() -> [Transaction]?{
        self.request.predicate = nil
        //changer le predicate pour que ca correspond a un travel
        do{
            //return try CoreDataManager.context.fetch(self.request)
            let t1 : Transaction  = Transaction(name: "Café", price: 3.00)
            let t2 : Transaction  = Transaction(name: "Resto", price: 25.95)
            
            var tt : [Transaction] = []
            tt.append(t1)
            tt.append(t2)
            
            return tt
            
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
