//
//  ShowTravel_ViewController.swift
//  ManageUrTrip
//
//  Created by Ines MISSOUM-BENZIANE on 26/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class ShowTravel_ViewController: UIViewController {
    
    var travelSelected : Travel?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var dates: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let atravel = self.travelSelected {
            self.name.text = atravel.title
            self.name.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            self.image.image = UIImage(named: "beach-1")
            
            
            let format = DateFormatter()
            format.dateFormat = "dd/MM/yyyy"
            let textD1 = format.string(from: atravel.beginning!)
            //idem pour date de fin
            //let textD2 = format.string(from: atravel.end!)
            self.dates.text = "\(textD1) - end DateTODO? "
            
        } else {
            self.name.text = ""
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ParticipantsShow") {
            
            if let destination = segue.destination as? ParticipatingFriendviewController {
                //on fait passer le voyage dans la vue d'après
                destination.travelSelected = self.travelSelected
                
            }
            
        }
        if (segue.identifier == "showSpending") {
            
            if let destination = segue.destination as? SpendingViewController {
                destination.travelSelected = self.travelSelected
            }
            
        }
        if (segue.identifier == "showBalance") {
            
            if let destination = segue.destination as? Balance_ViewController {
                destination.travelSelected = self.travelSelected
            }
            
        }
        
    }
}
