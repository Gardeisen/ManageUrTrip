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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let afriend = self.friendSelected {
            self.fullname.text = afriend.fullname
            self.priceBalance.textColor = UIColor.red
            //self.priceBalance.text = afriend.pTotal_I_payed
            
        } else {
            self.fullname.text = ""
        }
    }
    
    
}
