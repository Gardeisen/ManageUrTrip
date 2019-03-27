//
//  Travel_TableViewController.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class Travel_TableViewController: NSObject, UITableViewDataSource, TravelSetViewModelDelegate  {

    @IBOutlet weak var tableView: UITableView!
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
        cell.detailTextLabel?.text = " voici un sous titre"
        cell.imageView?.image = UIImage(named: "beach")
        return cell
    }
    
    func dataSetChanged() {
        
    }
    
    func travelDeleted(at indexPath: IndexPath) {
        
    }
    
    func travelUpdated(at indexPath: IndexPath) {
        
    }
    
    func travelAdded(at indexPath: IndexPath) {
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
    }
    
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool{
       return true
    }
}
