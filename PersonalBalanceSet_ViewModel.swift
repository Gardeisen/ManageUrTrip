//
//  PersonalBalanceSet_ViewModel.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

protocol PersonalBalanceSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a PersonalBalance is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func personalBalanceDeleted(at indexPath: IndexPath)
    
    
    /// called when a PersonalBalance is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func personalBalanceUpdated(at indexPath: IndexPath)
    
    
    /// called when a PersonalBalance is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func personalBalanceAdded(at indexPath: IndexPath)
}

//----------------------------------------------------------------------------------------------------------------
class PersonalBalanceSetViewModel {
    
    // MARK: -
    private let modelset : PersonalBalanceSet
    var dataset : [PersonalBalance] = []
    var delegate : PersonalBalanceSetViewModelDelegate? = nil
    
    
    init() {
        self.modelset = PersonalBalanceSet()
    }
    
    init(friend : Friend) {
        let data = PersonalBalanceDAO.fetchAllBalanceOfFriend(friend: friend)
        self.modelset = PersonalBalanceSet(balance: data)
        for p in self.modelset{
            self.dataset.append(p)
        }
    }
    convenience init(delegate : PersonalBalanceSetViewModelDelegate) {
        self.init()
        self.delegate = delegate
        
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new PersonalBalance in set of PersonalBalances
    ///
    /// - Parameter PersonalBalance: PersonalBalance to be added
    public func add(balance: PersonalBalance){
        if self.modelset.indexOf(b: balance) == -1{
            self.modelset.add(balance: balance)
            self.dataset.append(balance)
            self.delegate?.personalBalanceAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }}
    
    public func delete(balanceAt index: Int){
        PersonalBalanceDAO.delete(balance: self.dataset[index])
        self.modelset.remove(balance : self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.personalBalanceDeleted(at: IndexPath(row: index,section:0))
    }
    /// numbers of PersonalBalance
    ///
    /// - Returns: number of PersonalBalance
    public var count : Int{
        return self.dataset.count
    }
    
    
    
    public func get(balanceAt index: Int) -> PersonalBalance?{
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
    
}
