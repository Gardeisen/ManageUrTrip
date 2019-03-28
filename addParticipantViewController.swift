//
//  addParticipantViewController.swift
//  ManageUrTrip
//
//  Created by etud 2 ig on 28/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class addParticipantViewController: UIViewController, UITextFieldDelegate  {

    
    @IBOutlet weak var firstnameTextField: UITextField!
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    var newFriend : Friend?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "save" { //UNWIND LINK
            let firstname : String  = self.firstnameTextField.text!
            let lastname : String = self.lastnameTextField.text!
            self.newFriend = Friend(firstname: firstname, lastname: lastname)
        }
        else{
            self.newFriend = nil
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
