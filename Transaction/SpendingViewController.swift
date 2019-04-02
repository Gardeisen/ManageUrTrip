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
            self.TransactionTableViewController.transactionSet_ViewModel = TransactionSetViewModel(travel: atravel)            
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
            // let newTravelController = sender.source as! CreateTravel_ViewController
            //let embedTravelController = newTravelController.childViewControllers[0] as! EmbedTravelViewController
            
            /*let embedTravelController = sender.source as! EmbedTravelViewController
            if let travel = embedTravelController.newTravel{
                self.TravelTableViewController.travelSet_ViewModel.add(trav: travel)
                CoreDataManager.save()
            }*/
        }
    }
    
}
