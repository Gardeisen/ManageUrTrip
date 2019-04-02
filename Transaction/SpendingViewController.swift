//
//  SpendingViewController.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class SpendingViewController: UIViewController {
    
    @IBOutlet var TransactionTableViewController: Transaction_TableViewController!
    var travelSelected : Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let atravel = self.travelSelected {
            self.TransactionTableViewController.transactionSet_ViewModel = TransactionSetViewModel(delegate: self.TransactionTableViewController, travel: atravel)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "newSpent") {
            
            if let destination = segue.destination as? CreateSpentViewController {
                destination.travelSelect = self.travelSelected
                print("je passe le travel au embed view")
                
            }
            
        }
    }
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if(sender.identifier == "save"){ //Unwind LINK
            let embedTravelController = sender.source as! EmbedTransactionViewController
            if let transaction = embedTravelController.newTransaction{
                self.TransactionTableViewController.transactionSet_ViewModel.add(tran: transaction)
                CoreDataManager.save()
            }
        }
    }
    
}
