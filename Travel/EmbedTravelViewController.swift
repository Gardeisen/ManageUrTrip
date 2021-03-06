//
//  EmbedTravelViewController.swift
//  ManageUrTrip
//
//  Created by Marine  on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class EmbedTravelViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var title_field: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    
    @IBOutlet var tableParticipantEmbedTravel: TableParticipantEmbedViewController!
    var newTravel : Travel?
    var participants : [Friend] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let travelToUpdate = self.newTravel {
            // only for the case of Update

            self.title_field.text = travelToUpdate.title
            self.startDate.date = travelToUpdate.beginning!
            //self.endDate.date = travelToUpdate.end!
            self.tableParticipantEmbedTravel.friendSetViewModel = FriendSetViewModel(travel: travelToUpdate)
            
        }
       
    }
    // preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            
        if segue.identifier == "save" { //UNWIND LINK
            let title : String  = self.title_field.text!
            if(self.newTravel==nil){
                self.newTravel = Travel(t: title)
            }
            
            self.newTravel?.title = title
            for f in participants {
                f.participates = self.newTravel
            }
            
            newTravel?.beginning = self.startDate.date
            
           
        }
        else if segue.identifier == "cancel"{
            
            for f in participants {
                FriendDAO.delete(friend: f)
            }
            
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
    
    
    @IBAction func addParticipantsFriend(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Friend to this Trip ", message: "insert Participant", preferredStyle: .alert)
        
        
        alert.addTextField { (firstname) in
            firstname.placeholder = "Enter firstname"
        }
        alert.addTextField { (lastname) in
            lastname.placeholder = "Enter lastname"
        }
        
        let saveAction = UIAlertAction(title: "SAVE", style: .default) {
            
            [unowned self] action in
            guard let textFields = alert.textFields,  let firstname = textFields[0].text,  let lastname = textFields[1].text else {
                return
            }

            let friend = Friend(firstname: firstname, lastname: lastname)
            self.participants.append(friend)
            self.tableParticipantEmbedTravel.friendSetViewModel.add(friend: friend)
            self.tableParticipantEmbedTravel.tableView.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
}
