//
//  TableParticipatingController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class TableParticipatingController: NSObject , UITableViewDataSource, FriendSetViewModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var friendSet_ViewModel : FriendSetViewModel
    
    override init() {
        self.friendSet_ViewModel = FriendSetViewModel()
        super.init()
        self.friendSet_ViewModel.delegate=self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.friendSet_ViewModel.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath = position de la cellule dans tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellParticipants", for: indexPath)
        guard let friend = self.friendSet_ViewModel.get(friendAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(friend.fullname) "
        //cell.detailTextLabel?.text = " voici un sous titre"
        //cell.imageView?.image = UIImage(named: "beach")
        return cell
    }
    

    func dataSetChanged() {
        
    }
    
    func friendDeleted(at indexPath: IndexPath) {
        
    }
    
    func friendUpdated(at indexPath: IndexPath) {
        
    }
    
    func friendAdded(at indexPath: IndexPath) {
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.middle)
        self.tableView.endUpdates()
    }

    
}
