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
            self.image.image = UIImage(named: "beach")
            
        } else {
            self.name.text = ""
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ParticipantsShow") {
            
            if let destination = segue.destination as? ParticipatingFriendviewController {
                
                destination.travelSelected = self.travelSelected
                
                /*guard let friends = self.ParticipantsViewController.friendSet_ViewModel else{
                    fatalError("no travel found at this index")
                }
                destination.travelSelected = friends*/
            }
            
        }
        
    }
}
