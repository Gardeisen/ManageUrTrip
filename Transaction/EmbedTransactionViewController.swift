//
//  EmbedTransactionViewController.swift
//  ManageUrTrip
//
//  Created by etud 2 ig on 29/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class EmbedTransactionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textTitle: UITextField!
    
    @IBOutlet weak var interPrice: UITextField!
    
    
    @IBOutlet var EmbedTransactionController: TableFriends_TransactionViewController!
    
    
    
    
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
