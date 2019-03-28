//
//  AlertHelper.swift
//  ManageUrTrip
//
//  Created by etud ig on 28/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class AlertHelper: UIViewController {
    
    func alert(title: String, message: String) -> Bool {
        
        var ok = false
        
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
        
        return ok
    }

}
