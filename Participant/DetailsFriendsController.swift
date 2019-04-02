//
//  DetailsFriendsController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class DetailsFriendsController: UIViewController {
    
    var friendSelected : Friend?
    @IBOutlet weak var tableBalance: UITableView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var priceBalance: UILabel!
    
    @IBOutlet weak var moneySpent: UILabel!
    
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet var tablePersoBalance: TablePersonalBalance_ViewController!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let afriend = self.friendSelected {
            
            self.fullname.text = afriend.fullname
            let balance = (afriend.pTotal_I_payed) - (afriend.pTotalCosts)
            self.moneySpent.text = " \(afriend.pTotal_I_payed) €"
            self.moneySpent.backgroundColor = #colorLiteral(red: 0.5470487775, green: 0.7698300457, blue: 1, alpha: 1)
            self.totalCost.text = " \(afriend.total_costs)  €"
            self.totalCost.backgroundColor = #colorLiteral(red: 0.5470487775, green: 0.7698300457, blue: 1, alpha: 1)
            
            if balance >= 0 {
                self.priceBalance.text = "+ \(balance) €"
                self.priceBalance.backgroundColor = #colorLiteral(red: 0.4445736706, green: 0.7443419099, blue: 0.600685358, alpha: 1)
                
            }
            else {
                self.priceBalance.text = " \(balance) €"
                self.priceBalance.backgroundColor = #colorLiteral(red: 1, green: 0.3798090219, blue: 0.3253325522, alpha: 1)
            }
            self.tablePersoBalance.balancePersonalSet_ViewModel = PersonalBalanceSetViewModel(friend : afriend)
        }
        else {
            self.fullname.text = ""
        }
    
        
    }
    
    
}
