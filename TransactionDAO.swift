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
            return try CoreDataManager.context.fetch(self.request)
            
        }
        catch{
            return nil
        }
        
    }
    
    static func fetchAllTransactionOfTravel(travel : Travel) -> [Transaction]{
        var travelTransaction: [Transaction] = []
        
        if let _fiendsOfTravel = TravelDAO.getFriendOfATravel(travel: travel){
            
            for f in _fiendsOfTravel.allObjects as! [Friend]{
                
                if let _transactionsOfFriend = f.payes{
                    
                     for t in _transactionsOfFriend.allObjects as! [Transaction]{
                        
                        travelTransaction.append(t)
                    }
                }
            }
        }
        return travelTransaction
        
    }
    
    static func creationTransactionUpdates(payedBy_friend: Friend, t: Transaction, selectedFriends : FriendSet, priceForEach : Float ){
        //the transaction
        t.isPayedBy = payedBy_friend
        
        var debt : Debt
        for pers in selectedFriends{
            if(pers != payedBy_friend){
               var debt = Debt(price: priceForEach, friend: pers, transaction: t)
                PersonalBalanceDAO.updatePersonalBalances(payer: payedBy_friend, other: pers, value: priceForEach)
            }
            pers.total_costs = pers.total_costs  + priceForEach
            
            
        }
        CoreDataManager.save()
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
