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
    
    
    @IBAction func addParticipantsFriend(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add ", message: "bb", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func unwindToAddTravel(sender: UIStoryboardSegue) {
        if(sender.identifier == "save"){ //Unwind LINK
            // let newTravelController = sender.source as! CreateTravel_ViewController
            //let embedTravelController = newTravelController.childViewControllers[0] as! EmbedTravelViewController
            let addParticipantsController = sender.source as! addParticipantViewController
            if let friend = addParticipantsController.newFriend{
                //self.TravelTableViewController.travelSet_ViewModel.add(trav: travel)
                CoreDataManager.save()
            }
        }
    }
    
    
    
}
