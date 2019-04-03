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
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var travelTableView: UITableView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.image2.image = UIImage(named: "ship")
        // Do any additional setup after loading the view, typically from a nib.
        self.TravelTableViewController = Travel_TableViewController(tableView: self.travelTableView, mainViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        self.TravelTableViewController.tableView.reloadData()
        
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

            if let destination = segue.destination as? EditTravel_ViewController{
                
                if let cell = sender as? UITableViewCell{
                    guard let indexPath = self.TravelTableViewController.tableView.indexPath(for: cell) else{
                        return
                    }
                    
                    guard let travel = self.TravelTableViewController.travelSet_ViewModel.get(travelAt: indexPath.row) else{
                        fatalError("no travel found at this index")
                    }
                    destination.travelToEdit = travel
                    
                }
            }
        }
    }
    
    // segue ViewControllerB -> ViewController
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if(sender.identifier == "save"){ //Unwind LINK
        let embedTravelController = sender.source as! EmbedTravelViewController
        if let travel = embedTravelController.newTravel{
            self.TravelTableViewController.travelSet_ViewModel.add(trav: travel)
                    CoreDataManager.save()
             }
        }
    }
}

