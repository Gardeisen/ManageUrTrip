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
    
    
    /// Allows to retrieve all the spendings of a travel
    ///
    /// - Parameter the travel
    /// - Returns: all the spendings of the travel in parameter
    static func fetchAllSpendingsOfTravel(travel : Travel) -> [Transaction]{
        var travelTransaction: [Transaction] = []
        
        //the transactions (spendings or payments) are not linked to the travel but to the friends of the travel
        if let _fiendsOfTravel = TravelDAO.getFriendOfATravel(travel: travel){
            
            for f in _fiendsOfTravel.allObjects as! [Friend]{
                
                if let _transactionsOfFriend = f.payes{
                    
                     for t in _transactionsOfFriend.allObjects as! [Transaction]{
                        if(t.isSpent){
                            travelTransaction.append(t)
                        }
                        
                    }
                }
            }
        }
        return travelTransaction
        
    }
    
    
    /// Makes all the updates needed in the dataBase when we create a Payment
    ///
    /// - Parameters:
    ///   - payedBy_friend: the friend that is responsible for the payment
    ///   - t: the transaction that just has been create and that lead to those updates
    ///   - selectedFriends: all the friends that the "payedBy_friend" payes back
    ///   - priceForEach: the price that is paye back to each selectedFriends
    
    static func creationPaymentUpdates(payedBy_friend: Friend, t: Transaction, selectedFriends : FriendSet, priceForEach : Float ){
        
        t.isPayedBy = payedBy_friend
        let debtPrice = priceForEach * (-1)
        
        var debt : Debt
        for pers in selectedFriends{
            if(pers != payedBy_friend){
                var debt = Debt(price: debtPrice, friend: pers, transaction: t)
                PersonalBalanceDAO.updatePersonalBalances(payer: payedBy_friend, other: pers, value: priceForEach)
                pers.total_i_payed =  pers.total_i_payed - priceForEach
            }
           
            
            
        }
        CoreDataManager.save()
    }
    
    /// Makes all the updates needed in the dataBase when we create a spending
    ///
    /// - Parameters:
    ///   - payedBy_friend: the friend that payes for the spending
    ///   - t: the transaction that just has been create and that lead to those updates
    ///   - selectedFriends: all the friends that are involved in the spending
    ///   - priceForEach: the cost of each selectedFriends 
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
