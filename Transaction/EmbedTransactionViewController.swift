//
//  EmbedTransactionViewController.swift
//  ManageUrTrip
//
//  Created by Marine G on 29/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class EmbedTransactionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textTitle: UITextField!
    
    @IBOutlet weak var interPrice: UITextField!
    
    
    @IBOutlet var EmbedTransactionController: TableFriends_TransactionViewController!
    
    var travelSelected : Travel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        //self.EmbedTransactionController.friendSetViewModel = FriendSetViewModel(travel: )
=======
        if let t = self.travelSelected {
            self.EmbedTransactionController.friendSetViewModel = FriendSetViewModel(travel : t)
            print("on initialise bien le controller avec le voyage")
        }
        else {
            print("on initialise pas le controller")
        }
>>>>>>> 1afaccb881ea08abf3cca86d9c2f11e39e5aa9b1
    }

    
    
    // MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            } }
        return false
    }
}
