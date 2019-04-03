//
//  TableofBalance_ViewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class TableofBalance_ViewController: NSObject, UITableViewDataSource, PersonalBalanceSetViewModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    var balancePersonalSet_ViewModel : PersonalBalanceSetViewModel
    
    override init() {
        self.balancePersonalSet_ViewModel = PersonalBalanceSetViewModel()
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let balance = self.balancePersonalSet_ViewModel.get(balanceAt: indexPath.row) else{
            fatalError("no transaction found at this index")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "allbalance", for: indexPath)
        let val = balance.value * (-1)
        let formatted_price = String(format: "%.2f€", val)
        cell.detailTextLabel?.text = formatted_price
        //cell.detailTextLabel?.text = "\(val)€"
        cell.textLabel?.text = " \(balance.isLinkedTo?.fullname ?? "" ) owes to \(balance.fullname) "
        
    
        return cell
            
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.balancePersonalSet_ViewModel.count
        
        
    }
    
    func dataSetChanged() {
        
    }
    
    func personalBalanceDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func personalBalanceUpdated(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        //self.tableView.
        self.tableView.endUpdates()
    }
    
    func personalBalanceAdded(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }
}
