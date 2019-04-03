//
//  PersonalBalanceDAO.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 01/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import CoreData
import Foundation

class PersonalBalanceDAO {
    
    static let request : NSFetchRequest<PersonalBalance> = PersonalBalance.fetchRequest()
    static func save(){
        CoreDataManager.save()
    }
   
    static func fetchAll() -> [PersonalBalance]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
        
    }
    static func getPersonalBalance( owner : Friend, fn : String ) -> [PersonalBalance]? {
        self.request.predicate = NSPredicate(format: "pFullname == %@ AND isLinkedTo == %@", fn,  owner)
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
    
    static func updatePersonalBalances( payer : Friend, other : Friend, value : Float){
        let payerBalance : [PersonalBalance]? = getPersonalBalance(owner: payer, fn: other.fullname)
        
        if(payerBalance!.count == 0){
            let pB : PersonalBalance = PersonalBalance(fullname: other.fullname, value: value)
            pB.isLinkedTo = payer
        }else{
            payerBalance![0].pValue = payerBalance![0].pValue + value
        }
        
        let otherBalance :  [PersonalBalance]? = getPersonalBalance(owner: other,fn: payer.fullname)

        if(otherBalance!.count == 0){
            let pB : PersonalBalance = PersonalBalance(fullname: payer.fullname, value: -value)
            pB.isLinkedTo = other
            
        }else{
            otherBalance![0].pValue = otherBalance![0].pValue - value
        }
        
    }
    
    
    static func fetchAllBalanceOfFriend(friend: Friend) -> [PersonalBalance]{
        
        var persoBalance: [PersonalBalance] = []
        
        for balance in friend.hasAdebt?.allObjects as! [PersonalBalance] {
            
            persoBalance.append(balance)
        }
        
        return persoBalance
    }
    
    static func fetchAllBalance(travel : Travel) -> [PersonalBalance]{
        
        var Balance: [PersonalBalance] = []
        
        if let _fiendsOfTravel = TravelDAO.getFriendOfATravel(travel: travel){
            
            for f in _fiendsOfTravel.allObjects as! [Friend]{
                
                var tab : [PersonalBalance] = []
                tab = PersonalBalanceDAO.fetchAllBalanceOfFriend(friend: f)
                for i in tab {
                    if i.value < 0 {
                        Balance.append(i)
                    }
                }
                
            }
            
          return Balance
        }
        else {
            return Balance
        }
    }
    
    static func delete(balance : PersonalBalance){
        CoreDataManager.context.delete(balance)
    }

}
