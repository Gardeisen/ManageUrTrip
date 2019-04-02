//
//  Transaction_TableViewController.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class Transaction_TableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, TransactionSetViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var transactionSet_ViewModel : TransactionSetViewModel
    
    override init() {
        self.transactionSet_ViewModel = TransactionSetViewModel()
        super.init()
        self.transactionSet_ViewModel.delegate=self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.transactionSet_ViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath = position de la cellule dans tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSpending", for: indexPath)
        guard let transaction = self.transactionSet_ViewModel.get(transactionAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(transaction.name)     \(transaction.t_price)€"
        cell.textLabel?.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        cell.detailTextLabel?.text = " Payed by: \(transaction.isPayedBy?.fullname ?? "")"
        cell.imageView?.image = UIImage(named: "coins")
        return cell
    }
    
    
    func dataSetChanged() {
        
    }
    
    func transactionDeleted(at indexPath: IndexPath) {
        
    }
    
    func transactionUpdated(at indexPath: IndexPath) {
        
    }
    
    func transactionAdded(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }
    
}
