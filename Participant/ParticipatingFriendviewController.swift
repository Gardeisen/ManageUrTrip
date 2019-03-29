//
//  ParticipatingFriendviewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 27/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class ParticipatingFriendviewController: UIViewController {

    
    var travelSelected : Travel?
    @IBOutlet var ParticipantsViewController: TableParticipatingController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let atravel = self.travelSelected {
            self.ParticipantsViewController.friendSet_ViewModel = FriendSetViewModel(travel: atravel)
            
        } else {
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
