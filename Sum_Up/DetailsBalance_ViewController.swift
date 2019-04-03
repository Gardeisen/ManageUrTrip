//
//  DetailsBalance_ViewController.swift
//  ManageUrTrip
//
//  Created by Marine GARDEISEN on 02/04/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class DetailsBalance_ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var travelSelected : Travel?
    
    @IBOutlet var tableDetailBalance_ViewController: TableDetailBalance_ViewController!
    
    override func viewDidLoad() {
        self.image.image = UIImage(named: "debt-2")
        if let atravel = self.travelSelected {
            
            self.tableDetailBalance_ViewController.friendSet_ViewModel = FriendSetViewModel(travel: atravel)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        self.tableDetailBalance_ViewController.tableView.reloadData()
        
    }
    
}
