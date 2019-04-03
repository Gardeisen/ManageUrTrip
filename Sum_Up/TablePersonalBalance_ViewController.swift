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
        
        var formatted_price : String
        if balance.value > 0 {
            formatted_price = String(format: "%.2f", balance.value)

            cell.textLabel?.text = " \(balance.fullname) owes me \(formatted_price)€"
            cell.backgroundColor = #colorLiteral(red: 0.4445736706, green: 0.7443419099, blue: 0.600685358, alpha: 1)
        }
        else if balance.value < 0 {
            let val = balance.value * (-1)
            formatted_price = String(format: "%.2f", val)
            cell.textLabel?.text = " I owe \(formatted_price)€ to \(balance.fullname) "
            cell.backgroundColor = #colorLiteral(red: 0.9982178807, green: 0.3798628449, blue: 0.3255227804, alpha: 1)
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // allows to choose the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //allows to choose the number of rows
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
