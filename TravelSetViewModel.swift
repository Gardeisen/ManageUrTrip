//
//  TravelSetViewModel.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

/// Delegate to simulate reactive programming to change of travel set
protocol TravelSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a Travel is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func travelDeleted(at indexPath: IndexPath)
    
    
    /// called when a Travel is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func travelUpdated(at indexPath: IndexPath)
    
    
    /// called when a Travel is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func travelAdded(at indexPath: IndexPath)
}

//----------------------------------------------------------------------------------------------------------------
class TravelSetViewModel {

    // MARK: -
    private let modelset : TravelSet
    var dataset : [Travel] = []
    var delegate : TravelSetViewModelDelegate? = nil
    
    init() {
        if let data = TravelDAO.fetchAll(){
            self.modelset = TravelSet(travels: data)
            for p in self.modelset{
                self.dataset.append(p)
            }
        }
        else{
            self.modelset = TravelSet()
        }
    }
    convenience init(delegate : TravelSetViewModelDelegate) {
        self.init()
        self.delegate = delegate
        
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new travel in set of persons
    ///
    /// - Parameter travel: Travel to be added
    public func add(trav: Travel){
        if self.modelset.indexOf(t: trav) == -1{
            self.modelset.add(travel: trav)
            self.dataset.append(trav)
            self.delegate?.travelAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }}
    
    public func delete(travelAt index: Int){
        TravelDAO.delete(travel: self.dataset[index])
        self.modelset.remove(travel: self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.travelDeleted(at: IndexPath(row: index,section:0))
    }
    /// numbers of travels
    ///
    /// - Returns: number of travels
    public var count : Int{
        return self.dataset.count
    }
    
    

    public func get(travelAt index: Int) -> Travel?{
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
    
}
