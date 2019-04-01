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
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var transactionDate: UIDatePicker!
    @IBOutlet weak var payedBy: UIPickerView!
    
    @IBOutlet var EmbedTransactionController: TableFriends_TransactionViewController!
    
    var travelSelected : Travel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let t = self.travelSelected {
            self.EmbedTransactionController.friendSetViewModel = FriendSetViewModel(travel : t)
            print("on initialise bien le controller avec le voyage")
        }
        else {
            print("on initialise pas le controller")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "save" { //UNWIND LINK
            
            
        }
        else if segue.identifier == "cancel"{
                
            
            
        }
        else{
            
        } }
    
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
