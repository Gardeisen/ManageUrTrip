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
    
    
    func dataSetChanged() {
        
    }
    
    func friendDeleted(at indexPath: IndexPath) {
        
    }
    
    func friendUpdated(at indexPath: IndexPath) {
        
    }
    
    func friendAdded(at indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        return cell
        
    }
    

}
