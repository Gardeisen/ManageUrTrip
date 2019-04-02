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
        
        if balance.value > 0 {
            
            cell.textLabel?.text = " \(balance.fullname) owes me \(balance.value)"
            cell.backgroundColor = #colorLiteral(red: 0.4445736706, green: 0.7443419099, blue: 0.600685358, alpha: 1)
        }
        else if balance.value < 0 {
            let val = balance.value * (-1)
            cell.textLabel?.text = " I owe \(val) to \(balance.fullname)"
            cell.backgroundColor = #colorLiteral(red: 0.9982178807, green: 0.3798628449, blue: 0.3255227804, alpha: 1)
        }
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
