//
//  FriendSetViewModel.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

protocol FriendSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a friend is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func friendDeleted(at indexPath: IndexPath)
    
    
    /// called when a friend is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func friendUpdated(at indexPath: IndexPath)
    
    
    /// called when a friend is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func friendAdded(at indexPath: IndexPath)
}

//----------------------------------------------------------------------------------------------------------------
class FriendSetViewModel {
    
    // MARK: -
    private let modelset : FriendSet
    var dataset : [Friend] = []
    var delegate : FriendSetViewModelDelegate? = nil
    
    init() {
        if let data = FriendDAO.fetchAll(){
            self.modelset = FriendSet(friend: data)
            for p in self.modelset{
                self.dataset.append(p)
            }
        }
        else{
            self.modelset = FriendSet()
        }
    }
    convenience init(delegate : FriendSetViewModelDelegate) {
        self.init()
        self.delegate = delegate
        
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new friend in set of friend
    ///
    /// - Parameter friend: Friend to be added
    public func add(friend: Friend){
        if self.modelset.indexOf(f: friend) == -1{
            self.modelset.add(friend: friend)
            self.dataset.append(friend)
            self.delegate?.friendAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
            
            print(self.modelset.count() - 1)
        }}
    
    public func delete(friendAt index: Int){
        FriendDAO.delete(friend : self.dataset[index])
        self.modelset.remove(friend: self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.friendDeleted(at: IndexPath(row: index,section:0))
    }
    
    /// numbers of travels
    ///
    /// - Returns: number of travels
    public var count : Int{
        return self.dataset.count
    }
    

    public func get(friendAt index: Int) -> Friend?{
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
    
}
