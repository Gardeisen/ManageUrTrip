//
//  Travel_TableViewController.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class Travel_TableViewController: NSObject, UITableViewDataSource, TravelSetViewModelDelegate  {

    var travelSet_ViewModel : TravelSetViewModel
    
    override init() {
        self.travelSet_ViewModel = TravelSetViewModel()
        super.init()
        self.travelSet_ViewModel.delegate=self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.travelSet_ViewModel.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath = position de la cellule dans tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTrip", for: indexPath)
        guard let travel = self.travelSet_ViewModel.get(travelAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(travel.title) "
        return cell
    }
    
    func dataSetChanged() {
        
    }
    
    func personDeleted(at indexPath: IndexPath) {
        
    }
    
    func personUpdated(at indexPath: IndexPath) {
        
    }
    
    func personAdded(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }

}
