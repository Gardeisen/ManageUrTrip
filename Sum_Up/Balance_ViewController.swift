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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detailsOfBalance") {
            
            if let destination = segue.destination as? DetailsBalance_ViewController {
                destination.travelSelected = self.travelSelected
                
            }
            
        }
}
}
