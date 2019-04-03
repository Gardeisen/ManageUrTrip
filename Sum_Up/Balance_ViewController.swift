//
//  Balance_ViewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class Balance_ViewController: UIViewController {

    @IBOutlet var tableBalance_viewController: TableofBalance_ViewController!
    var travelSelected : Travel?
    
    
    override func viewDidLoad() {
        
        if let atravel = self.travelSelected {
         
            self.tableBalance_viewController.balancePersonalSet_ViewModel = PersonalBalanceSetViewModel(travel : atravel)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        self.tableBalance_viewController.tableView.reloadData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detailsOfBalance") {
            
            if let destination = segue.destination as? DetailsBalance_ViewController {
                destination.travelSelected = self.travelSelected
                
            }
            
        }
        
        if (segue.identifier == "newPayment"){
            if let destination = segue.destination as? CreatePaymentViewController {
                destination.travelSelect = self.travelSelected
                print(destination.travelSelect==nil)
            }
        }
    }
    
    @IBAction func unwindToBalanceView(sender: UIStoryboardSegue) {
        
    }
}
