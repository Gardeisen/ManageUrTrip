//
//  EmbedTransactionViewController.swift
//  ManageUrTrip
//
//  Created by Marine G on 29/03/2019.
//  Copyright © 2019 Marine GARDEISEN. All rights reserved.
//

import UIKit

class EmbedTransactionViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate,
UIPickerViewDataSource{

    @IBOutlet weak var textTitle: UITextField!
    
    @IBOutlet weak var interPrice: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var transactionDate: UIDatePicker!
    @IBOutlet weak var payedBy: UIPickerView!
    
    @IBOutlet var EmbedTransactionController: TableFriends_TransactionViewController!
    
    var isSpent: Bool?
    var travelSelected : Travel!
    var payedBy_friend : Friend? = nil
    
    var pickerData : [Friend] = []
    
    var newTransaction : Transaction?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set picker data
        if let _data = TravelDAO.getFriendOfATravel(travel: travelSelected){
            
            for f in _data.allObjects as! [Friend]{
                self.pickerData.append(f)
            }
        }
        
        self.payedBy_friend = self.pickerData[0]
        
        //connect the pickerView :
        self.payedBy.delegate = self
        self.payedBy.dataSource = self
        
        if let t = self.travelSelected {
            self.EmbedTransactionController.friendSetViewModel = FriendSetViewModel(travel : t)
            self.transactionDate.minimumDate = t.beginning
        }
        else {
        }
    }

    
    //number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //number of roxs of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //the data to return for the row and column that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].fullname
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //the friend selected in the picker :
        payedBy_friend = pickerData[row]
    }
    // MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            } }
        return false
    }
}
