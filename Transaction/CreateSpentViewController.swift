//
//  CreateSpentViewController.swift
//  ManageUrTrip
//
//  Created by etud 2 ig on 29/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class CreateSpentViewController: UIViewController {

    var travelSelect : Travel?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EmbedTransactionViewController {
            destination.travelSelected = self.travelSelect
            destination.isSpent = true
           
            
        }
        
    }
    
}
