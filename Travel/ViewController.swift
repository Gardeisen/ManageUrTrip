//
//  ViewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var TravelTableViewController: Travel_TableViewController!
    
    @IBOutlet weak var travelTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.TravelTableViewController = Travel_TableViewController(tableView: self.travelTableView, mainViewController: self)
        
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
                    //self.TravelTableViewController.mainVC = nil
                }
            }
            
        }
        if (segue.identifier == "editTravel"){
            
            print("etape2 : je passe dans le seg jusqu'au EditTravel")
            
            if let destination = segue.destination as? EditTravel_ViewController{
                
                if let cell = sender as? UITableViewCell{
                    guard let indexPath = self.TravelTableViewController.tableView.indexPath(for: cell) else{
                        return
                    }
                    
                    guard let travel = self.TravelTableViewController.travelSet_ViewModel.get(travelAt: indexPath.row) else{
                        fatalError("no travel found at this index")
                    }
                    destination.travelToEdit = travel
                    print("etape2 : ok")
                    
                }
            }
            
        }
        
    }
    
    // segue ViewControllerB -> ViewController
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if(sender.identifier == "save"){ //Unwind LINK
       // let newTravelController = sender.source as! CreateTravel_ViewController
        //let embedTravelController = newTravelController.childViewControllers[0] as! EmbedTravelViewController
        let embedTravelController = sender.source as! EmbedTravelViewController
        if let travel = embedTravelController.newTravel{
            self.TravelTableViewController.travelSet_ViewModel.add(trav: travel)
                    CoreDataManager.save()
             }
        }
    }
}

