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
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image.image = UIImage(named: "high-five-2")
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "showDetailsFriend"){
            
            if let destination = segue.destination as? DetailsFriendsController {
                if let cell = sender as? UITableViewCell{
                    
                    guard let indexPath = self.ParticipantsViewController.tableView.indexPath(for: cell) else{
                        return
                    }
                    
                    guard let friend = self.ParticipantsViewController.friendSet_ViewModel.get(friendAt: indexPath.row) else{
                        fatalError("no friend found at this index")
                    }
                    destination.friendSelected = friend
                }
            }
            
        }
    }
}
