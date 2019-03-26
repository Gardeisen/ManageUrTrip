//
//  ViewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var TravelTableViewController: Travel_TableViewController!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "ShowTravelDetails"){
            
            if let destination = segue.destination as? ShowTravel_ViewController {
                if let cell = sender as? UITableViewCell{
                    
                    guard let indexPath = self.TravelTableViewController.tableView.indexPath(for: cell) else{
                        return
                    }
                    
                    guard let travel = self.TravelTableViewController.travelSet_ViewModel.get(travelAt: indexPath.row) else{
                        fatalError("no travel found at this index")
                    }
                    destination.travelSelected = travel
                    
                }
            }
            
        }
        
    }
}

