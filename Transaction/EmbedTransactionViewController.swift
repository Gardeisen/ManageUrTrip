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
        //pickerData = ["it 1", "it2", "it3"]
        
        if let t = self.travelSelected {
            self.EmbedTransactionController.friendSetViewModel = FriendSetViewModel(travel : t)
            print("on initialise bien le controller avec le voyage")
        }
        else {
            print("on initialise pas le controller")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "save" { //UNWIND LINK
            
            // retrieve the total price and update the payer
            let p : Float = (self.interPrice.text! as NSString).floatValue
            self.payedBy_friend!.total_i_payed = self.payedBy_friend!.total_i_payed  + p
            
            //the price for each
            let priceForEach = p / Float(self.EmbedTransactionController.selectedFriends.count())

            //creation of the transaction
            let t = Transaction(name: self.textTitle.text!, total_price: p, spent: self.isSpent!)
            TransactionDAO.creationTransactionUpdates(payedBy_friend: self.payedBy_friend!, t: t, selectedFriends : self.EmbedTransactionController.selectedFriends, priceForEach : priceForEach )
            
            
        }
        else if segue.identifier == "cancel"{}
        else{
            
        } }
    
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
