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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //to load the view to add a transaction
        if let destination = segue.destination as? EmbedTransactionViewController {
            destination.travelSelected = self.travelSelect
            destination.isSpent = true
            
        }
        
        //to save the new transaction
        if let s = segue.destination as? SpendingViewController{
            
            if let e = self.childViewControllers[0] as? EmbedTransactionViewController{
                if segue.identifier == "save" { //UNWIND LINK
                    
                    // retrieve the total price and update the payer
                    var p : Float = (e.interPrice.text! as NSString).floatValue
                    //the price for each
                    var priceForEach = p / Float(e.EmbedTransactionController.selectedFriends.count())

                    //UPDATES :
                    e.payedBy_friend!.total_i_payed = e.payedBy_friend!.total_i_payed  + p
                    //creation of the transaction
                    e.newTransaction = Transaction(name: e.textTitle.text!, total_price: p, spent: e.isSpent!, transactionDate: e.transactionDate.date)
                    TransactionDAO.creationTransactionUpdates(payedBy_friend: e.payedBy_friend!, t: e.newTransaction!, selectedFriends : e.EmbedTransactionController.selectedFriends, priceForEach : priceForEach )
                    
                }
                else if segue.identifier == "cancel"{}
                else{
                    
                }
            }
        }
        
    }
    
}
