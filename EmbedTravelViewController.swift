//
//  EmbedTravelViewController.swift
//  ManageUrTrip
//
//  Created by etud ig on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class EmbedTravelViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var title_field: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    
    var newTravel : Travel?
    
    // preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "save" { //UNWIND LINK
            let title : String  = self.title_field.text!
            self.newTravel = Travel(t: title)
        }
        else{
            self.newTravel = nil
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
    
    @IBAction func addParticipant(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Participant", message: "Add a name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Add", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
        
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        
    }
    
}
