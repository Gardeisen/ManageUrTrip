//
//  EditTravel_ViewController.swift
//  ManageUrTrip
//
//  Created by etud ig on 29/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class EditTravel_ViewController: ViewController {
    var travelToEdit : Travel?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ok prepare")
        if segue.identifier == "embedEditTravel"{
            if let embedController = segue.destination as? EmbedTravelViewController{
                embedController.newTravel = self.travelToEdit
                print(travelToEdit == nil)
            }
        }
    }
}
