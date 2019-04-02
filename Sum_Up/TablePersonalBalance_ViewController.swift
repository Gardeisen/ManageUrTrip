//
//  TablePersonalBalance_ViewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class TablePersonalBalance_ViewController: NSObject, UITableViewDataSource, PersonalBalanceSetViewModelDelegate {
    
   
    @IBOutlet weak var tableView: UITableView!
    var balancePersonalSet_ViewModel : PersonalBalanceSetViewModel
    
    override init() {
        self.balancePersonalSet_ViewModel = PersonalBalanceSetViewModel()
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "equilibre", for: indexPath)
        guard let balance = self.balancePersonalSet_ViewModel.get(balanceAt: indexPath.row) else{
            fatalError("no transaction found at this index")
        }
        cell.textLabel?.text = " \(balance.value) "
        
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
