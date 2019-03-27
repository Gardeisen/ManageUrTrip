//
//  Transaction_TableViewController.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class Transaction_TableViewController: NSObject, UITableViewDataSource, TransactionSetViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var tarnsactionSet_ViewModel : TransactionSetViewModel
    
    override init() {
        self.tarnsactionSet_ViewModel = TransactionSetViewModel()
        super.init()
        self.tarnsactionSet_ViewModel.delegate=self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.tarnsactionSet_ViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath = position de la cellule dans tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSpending", for: indexPath)
        guard let transaction = self.tarnsactionSet_ViewModel.get(transactionAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(transaction.name) "
        return cell
    }
    
    
    func dataSetChanged() {
        
    }
    
    func transactionDeleted(at indexPath: IndexPath) {
        
    }
    
    func transactionUpdated(at indexPath: IndexPath) {
        
    }
    
    func transactionAdded(at indexPath: IndexPath) {
        print("//////////////tansactionAdded")
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }
    
}
