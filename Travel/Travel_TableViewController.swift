//
//  Travel_TableViewController.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class Travel_TableViewController: NSObject, UITableViewDelegate, UITableViewDataSource,  TravelSetViewModelDelegate  {

    var tableView: UITableView!
    var mainVC : ViewController!
    var travelSet_ViewModel : TravelSetViewModel
    
    init(tableView: UITableView, mainViewController: ViewController) {
        self.travelSet_ViewModel = TravelSetViewModel()
        self.tableView = tableView
        self.mainVC = mainViewController
        super.init()
        self.travelSet_ViewModel.delegate=self
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
        cell.textLabel?.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        cell.imageView?.image = UIImage(named: "beach")
        //handle date
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        cell.detailTextLabel?.text = format.string(from: travel.beginning ?? Date())
        
        
        return cell
    }
    
    func dataSetChanged() {
        
    }
    
    func travelDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func travelUpdated(at indexPath: IndexPath) {
        
    }
    
    func travelAdded(at indexPath: IndexPath) {
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }

    func deleteHandlerAction(action: UITableViewRowAction,indexPath: IndexPath) -> Void {
        self.travelSet_ViewModel.delete(travelAt: indexPath.row)
    }
    
    func editHandlerAction(action: UITableViewRowAction,indexPath: IndexPath) -> Void {
        self.mainVC.performSegue(withIdentifier: "editTravel", sender: self)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete", handler: self.deleteHandlerAction)
        delete.backgroundColor = UIColor.red
        //**** Faire une fonction editHandlerAction*****
        let edit = UITableViewRowAction(style: .default, title: "Edit", handler: self.editHandlerAction)
        edit.backgroundColor = UIColor.orange
        return [delete, edit]
        
    }
    
}
