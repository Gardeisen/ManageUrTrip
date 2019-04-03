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
        }
        
        //to save the new transaction
        if let s = segue.destination as? Balance_ViewController{
            
            if let e = self.childViewControllers[0] as? EmbedTransactionViewController{
                if segue.identifier == "save" { //UNWIND LINK
                    
                    // retrieve the total price and update the payer
                    var p : Float = (e.interPrice.text! as NSString).floatValue
                    //the price for each
                    var priceForEach = p / Float(e.EmbedTransactionController.selectedFriends.count())
                    priceForEach = priceForEach * (-1)
    
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
