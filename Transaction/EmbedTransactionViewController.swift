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
    
    var travelSelected : Travel? = Travel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.EmbedTransactionController.friendSetViewModel = FriendSetViewModel(travel : travelSelected! )
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
