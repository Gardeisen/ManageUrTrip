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
    
    var tablePersoBalance : TablePersonalBalance_ViewController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let afriend = self.friendSelected {
            self.fullname.text = afriend.fullname
            let balance = (afriend.pTotal_I_payed) - (afriend.pTotalCosts)
            
            if balance >= 0 {
                self.priceBalance.text = "+ \(balance)"
                self.priceBalance.backgroundColor = UIColor.green
                
            }
            else {
                self.priceBalance.text = " \(balance)"
                self.priceBalance.backgroundColor = UIColor.red
            }
            
        } else {
            self.fullname.text = ""
        }
        if let aFriend = self.friendSelected {
            //self.tablePersoBalance.balancePersonalSet_ViewModel = PersonalBalanceSetViewModel(friend : aFriend)
        }
        
        
    }
    
    
}
