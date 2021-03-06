//
//  TableParticipantEmbedViewController.swift
//  ManageUrTrip
//
//  Created by etud 2 ig on 28/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class TableParticipantEmbedViewController: NSObject, UITableViewDataSource, FriendSetViewModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var friendSetViewModel : FriendSetViewModel
    
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
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendSetViewModel.count
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        guard let friend = self.friendSetViewModel.get(friendAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(friend.fullname) "
        
        return cell
    }

}
