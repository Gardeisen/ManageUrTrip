//
//  CreatePaymentViewController.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 03/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class CreatePaymentViewController: UIViewController {

    var travelSelect : Travel?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmbedTransactionViewController {
            destination.travelSelected = self.travelSelect
            destination.isSpent = false
            print(destination.travelSelected==nil)
            
        }
        
    }
}
