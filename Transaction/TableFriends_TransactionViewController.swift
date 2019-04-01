//
//  TableFriends_TransactionViewController.swift
//  ManageUrTrip
//
//  Created by etud 2 ig on 29/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class TableFriends_TransactionViewController: NSObject, UITableViewDataSource, UITableViewDelegate, FriendSetViewModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var friendSetViewModel : FriendSetViewModel
    
    var selectedFriends : FriendSet = FriendSet(friend: [])
    
    override init() {
        self.friendSetViewModel = FriendSetViewModel()
        super.init()
        self.friendSetViewModel.delegate=self
    }
    
    func dataSetChanged() {
        
    }
    
    func friendDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func friendUpdated(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        //self.tableView.
        self.tableView.endUpdates()
    }
    
    func friendAdded(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.friendSetViewModel.count
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "payFor", for: indexPath)
        guard let friend = self.friendSetViewModel.get(friendAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(friend.fullname) "
        //tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            self.friendSetViewModel.delete(friendAt: indexPath.row)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let f = self.friendSetViewModel.get(friendAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        if(self.selectedFriends.contains(f)){
            print("removed")
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            self.selectedFriends.remove(friend: f)
        }else{
            print("added")
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            self.selectedFriends.add(friend: f)
        }
       
    }
    
}
