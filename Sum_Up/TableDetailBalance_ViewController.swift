//
//  TableDetailBalance_ViewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class TableDetailBalance_ViewController: NSObject, UITableViewDataSource, PersonalBalanceSetViewModelDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var friendSet_ViewModel : FriendSetViewModel
    
    
    override init() {
        self.friendSet_ViewModel = FriendSetViewModel()
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let friend = self.friendSet_ViewModel.get(friendAt: indexPath.row) else{
            fatalError("no transaction found at this index")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "participantBalance", for: indexPath)
        let eq = friend.pTotal_I_payed - friend.pTotalCosts
        cell.textLabel?.text = "\(friend.fullname) "
        cell.backgroundColor = UIColor.clear
        if eq > 0 {
            
            cell.detailTextLabel?.backgroundColor = #colorLiteral(red: 0.4445736706, green: 0.7443419099, blue: 0.600685358, alpha: 1)
            cell.detailTextLabel?.text = "+\(eq)€"
        }
        else
        {
            cell.detailTextLabel?.backgroundColor = #colorLiteral(red: 0.9982178807, green: 0.3798628449, blue: 0.3255227804, alpha: 1)
            cell.detailTextLabel?.text = "\(eq)€"
        }
        
        
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.friendSet_ViewModel.count
        
        
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
