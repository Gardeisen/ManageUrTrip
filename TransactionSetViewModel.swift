//
//  TransactionSetViewModel.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit


/// Delegate to simulate reactive programming to change of transaction set
protocol TransactionSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a Transaction is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func transactionDeleted(at indexPath: IndexPath)
    
    
    /// called when a Transaction is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func transactionUpdated(at indexPath: IndexPath)
    
    
    /// called when a Transaction is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func transactionAdded(at indexPath: IndexPath)
}

//----------------------------------------------------------------------------------------------------------------

class TransactionSetViewModel  {
    // MARK: -
    private let modelset : TransactionSet
    var dataset : [Transaction] = []
    var delegate : TransactionSetViewModelDelegate? = nil
    
    init() {
        self.modelset = TransactionSet()
    }
    
    init(travel : Travel) {
        let data = TransactionDAO.fetchAllSpendingsOfTravel(travel: travel)
        self.modelset = TransactionSet(transaction: data)
        for p in self.modelset{
            self.dataset.append(p)
        }
    }
    convenience init(delegate : TransactionSetViewModelDelegate, travel : Travel) {
        self.init(travel: travel)
        self.delegate = delegate
        
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new transaction in set of persons
    ///
    /// - Parameter transaction: Transaction to be added
    public func add(tran: Transaction){
      
        if self.modelset.indexOf(t: tran) == -1{
            self.modelset.add(transaction: tran)
            self.dataset.append(tran)
            self.delegate?.transactionAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
        }}
    
    /// numbers of transaction
    ///
    /// - Returns: number of transaction
    public var count : Int{
        return self.dataset.count
    }
    
    
    
    public func get(transactionAt index: Int) -> Transaction?{
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
    
}

